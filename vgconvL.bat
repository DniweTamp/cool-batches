@echo off
title Any sound VGAudio Conversion

set ffmpeg="C:\Program Files\ffmpeg\bin\ffmpeg.exe"
set vgaudiocli="D:\@Persona Modding tools\Decrypt P5R ADX\VGAudioCli.exe"

set /p "format=Which format do you want to use: "

setlocal EnableDelayedExpansion
FOR %%a IN (%*) DO (
    set /p "loop=Set loop points for %%~na.%format%: "
    echo Converting %%~na%%~xa
	%ffmpeg% -i %%a -hide_banner -loglevel error "%%~da%%~pa%%~na_conv.wav"
	%vgaudiocli% -i "%%~da%%~pa%%~na_conv.wav" "%%~da%%~pa%%~na.%format%" -l !loop!
	del "%%~da%%~pa%%~na_conv.wav"
)

::pause