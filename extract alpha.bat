@echo off
FOR %%a IN (%*) DO (
    echo Extracting alpha from %%~na%%~xa
    convert -alpha extract %%a "%%~pa%%~na_alpha.png"
)