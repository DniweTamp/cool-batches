@echo off
title texconv DDS Conversion

:: Requires you to have ImageMagick installed
:: for checking image alpha

::paths
call paths.bat
set "fileCount=0"
for %%A in (%*) do set /a "fileCount+=1"

setlocal EnableDelayedExpansion
FOR %%a IN (%*) DO (
    set /a "currentFile+=1"
    
    :: Calculate the progress
    set /a "progress=currentFile*20/fileCount"
    
    :: Create the progress bar
    set "progressBar="
    for /L %%B in (1,1,!progress!) do set "progressBar=!progressBar!#"
    for /L %%B in (!progress!,1,19) do set "progressBar=!progressBar!-"
    
    echo File !currentFile!/!fileCount! [!progressBar!]: %%~na%%~xa
    "%noesis%" ?cmode %%a "%%~da%%~pa%%~na_temp.tga"
	for /f %%i in ('identify -format %%[opaque] %%a') do set alpha=%%i
    if "!alpha!"=="False" set bc=BC3_UNORM
    if "!alpha!"=="True" set bc=BC1_UNORM
	if exist "%%~da%%~pa%%~na.dds" del "%%~da%%~pa%%~na.dds"
	"%texconv%" -f !bc! -pow2 -dx9 -nologo -timing -bc d -m 1 -y "%%~da%%~pa%%~na_temp.tga"
	ren "%%~da%%~pa%%~na_temp.dds" "%%~na.dds"
	del "%%~da%%~pa%%~na_temp.tga"
)

::pause