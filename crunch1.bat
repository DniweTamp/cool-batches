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
    if exist "%%~da%%~pa%%~na.dds" del "%%~da%%~pa%%~na.dds"
    "%crunch%" "%%~da%%~pa%%~na_temp.tga" -DXT1 -dxtQuality uber -fileformat dds
    ren "%%~da%%~pa%%~na_temp.dds" "%%~na.dds"
    del "%%~pa%%~na_temp.tga"
)

::pause