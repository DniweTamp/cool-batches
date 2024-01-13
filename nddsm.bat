@echo off
title Any texture to DDS Conversion

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

    for /f %%i in ('identify -format %%[opaque] %%a') do set alpha=%%i
    if "!alpha!"=="False" set bc=-18
    if "!alpha!"=="True" set bc=15
    %NEWNVTT% %%a -f !bc! -q 3 --no-mips -o "%%~da%%~pa%%~na.dds"
    cls
)

::pause