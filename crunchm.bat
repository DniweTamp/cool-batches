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
    if "!alpha!"=="False" set bc=-DXT5
    if "!alpha!"=="True" set bc=-DXT1
    "%crunch%" -quiet -clampScale 2048 2048 !bc! -fileformat dds -dxtQuality uber -mipMode None -outsamedir -file %%a
)

::pause