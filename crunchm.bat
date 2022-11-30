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
    identify -format %%[opaque] %%a > tmpFile
    set /p alpha= < tmpFile
    del tmpFile
    if "!alpha!"=="False" set bc=-DXT5
    if "!alpha!"=="True" set bc=-DXT1
    "%crunch%" -quiet -clampScale 2048 2048 !bc! -fileformat dds -dxtQuality uber -mipMode None -outsamedir -file %%a
)

::pause