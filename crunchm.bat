@echo off
title Any texture to DDS Conversion

:: Requires you to have ImageMagick installed
:: for checking image alpha

::paths
set crunch=E:\s\GitHub\crunch\bin\crunch_x64.exe
set noesis=E:\s\Noesis\Noesis.exe

setlocal EnableDelayedExpansion
FOR %%a IN (%*) DO (
    echo Converting %%~na%%~xa
    "%noesis%" ?cmode %%a "%%~da%%~pa%%~na_temp.tga"
    identify -format %%[opaque] "%%~da%%~pa%%~na_temp.tga" > tmpFile
    set /p alpha= < tmpFile
    del tmpFile
    if "!alpha!"=="False" set bc=-DXT5
    if "!alpha!"=="True" set bc=-DXT1
    if exist "%%~da%%~pa%%~na.dds" del "%%~da%%~pa%%~na.dds"
    "%crunch%" "%%~da%%~pa%%~na_temp.tga" !bc! -dxtQuality uber -fileformat dds -mipMode None
    ren "%%~da%%~pa%%~na_temp.dds" "%%~na.dds"
    del "%%~pa%%~na_temp.tga"
)

::pause