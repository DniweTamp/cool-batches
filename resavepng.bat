@echo off
title Resave PNG
set noesis=D:\s\Noesis\Noesis.exe
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
	"%noesis%" ?cmode "%%~da%%~pa%%~na.png" "%%~da%%~pa%%~na.tga"
	del "%%~da%%~pa%%~na.png"
	"%noesis%" ?cmode "%%~da%%~pa%%~na.tga" "%%~da%%~pa%%~na.png"
	del "%%~da%%~pa%%~na.tga"
    cls
)