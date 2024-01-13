@echo off
title Any texture to DDS Conversion

::paths
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
    
    echo File !currentFile!/!fileCount! [!progressBar!]: %%~nA%%~xA

    %NEWNVTT% %%a -f 15 -q 3 -o "%%~da%%~pa%%~na.dds"
)

::pause