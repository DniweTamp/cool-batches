@echo off
:: --- Check for three dropped files ---
if "%~3"=="" (
    echo.
    echo Usage: Drag and drop Col, MkA, and MkB onto this script.
    pause
    exit /b
)

:: --- Assign input filenames (order matters) ---
set "COL=%~1"
set "MKA=%~2"
set "MKB=%~3"

:: --- Create a temporary working folder ---
set "TMPDIR=%TEMP%\imgproc_%RANDOM%"
mkdir "%TMPDIR%"

:: ================================
:: New Step 1: Multiply entire RGB with #333333, then blend using inverted MkA's green channel as mask.
:: ================================
magick "%COL%" -alpha off "%TMPDIR%\col_rgb.png"
for /f "tokens=*" %%i in ('magick identify -format "%%wx%%h" "%COL%"') do set SIZE=%%i
magick -size %SIZE% xc:"#333333" "%TMPDIR%\solid.png"
magick "%TMPDIR%\col_rgb.png" "%TMPDIR%\solid.png" -compose Multiply -composite "%TMPDIR%\multiplied.png"
magick "%MKB%" -channel B -separate -negate "%TMPDIR%\mask.png"
magick "%TMPDIR%\multiplied.png" "%TMPDIR%\mask.png" -compose CopyOpacity -composite "%TMPDIR%\masked.png"
magick "%TMPDIR%\col_rgb.png" "%TMPDIR%\masked.png" -compose Over -composite "%TMPDIR%\step1_output.png"

:: ================================
:: Step 2: Process Col’s alpha channel.
:: Extract the alpha channel, multiply it by 2, clamp it, evaluate Pow 2.0.
:: The result is saved as step2_output.png.
:: ================================
magick "%COL%" -alpha extract -evaluate multiply 2 -clamp -evaluate Pow 2.0 "%TMPDIR%\step2_output.png"

:: ================================
:: Step 3: Multiply Col’s RGB with the processed alpha mask, then blend with the original RGB to simulate 50% opacity.
:: ================================
magick "%TMPDIR%\step1_output.png" "%TMPDIR%\step2_output.png" -compose Multiply -composite "%TMPDIR%\col_multiplied.png"
magick "%TMPDIR%\step1_output.png" "%TMPDIR%\col_multiplied.png" -define compose:args=50,50 -compose blend -composite "%TMPDIR%\step3_output.png"

:: ================================
:: Step 4: Apply a fully color dodge grey layer, then mask it using MkA’s green channel.
:: ================================
for /f "tokens=*" %%i in ('magick identify -format "%%wx%%h" "%TMPDIR%\step3_output.png"') do set SIZE=%%i
magick -size %SIZE% xc:"#808080" "%TMPDIR%\grey.png"
magick "%TMPDIR%\step3_output.png" "%TMPDIR%\grey.png" -compose ColorDodge -composite "%TMPDIR%\step4_full.png"
magick "%TMPDIR%\step4_full.png" "%MKA%" -channel G -separate -compose CopyOpacity -composite "%TMPDIR%\step4_masked.png"
magick "%TMPDIR%\step3_output.png" "%TMPDIR%\step4_masked.png" -compose Over -composite "%~dpn1_Merged.png"

echo.
echo Process complete. Output saved as %~n1_Merged.png
::pause
