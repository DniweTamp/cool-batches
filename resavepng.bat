@echo off
title Resave PNG
set noesis=D:\s\Noesis\Noesis.exe

FOR %%a IN (%*) DO (
    echo Resaving: %%~na%%~xa
	"%noesis%" ?cmode "%%~da%%~pa%%~na.png" "%%~da%%~pa%%~na.tga"
	del "%%~da%%~pa%%~na.png"
	"%noesis%" ?cmode "%%~da%%~pa%%~na.tga" "%%~da%%~pa%%~na.png"
	del "%%~da%%~pa%%~na.tga"
)