@echo off
title Any texture to DDS Conversion (Compatible with P5R)

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

    %NEWNVTT% %%a -f 18 -q 3 -o "%%~da%%~pa%%~na.dds"
    "%nvtt%" -bc1 "%%~da%%~pa%%~na.dds"
)

::pause