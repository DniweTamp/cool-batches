@echo off
title Scale PNG
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
    if not exist "%%~pa@4" mkdir "%%~pa@4"
    if not exist "%%~pa@8" mkdir "%%~pa@8"
    if not exist "%%~pa@16" mkdir "%%~pa@16"
    if not exist "%%~pa@32" mkdir "%%~pa@32"
    convert %%a -resize 4x4 "%%~pa@4\%%~na.png"
    convert %%a -resize 8x8 "%%~pa@8\%%~na.png"
    convert %%a -resize 16x16 "%%~pa@16\%%~na.png"
    convert %%a -resize 32x32 "%%~pa@32\%%~na.png"
)

::pause