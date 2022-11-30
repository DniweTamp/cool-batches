@echo off
title Any texture to DDS Conversion

::paths
set crunch=E:\s\GitHub\crunch\bin\crunch_x64.exe

setlocal EnableDelayedExpansion
FOR %%a IN (%*) DO (
    echo Converting %%~na%%~xa
    "%crunch%" -quiet -clampScale 2048 2048 -DXT1 -fileformat dds -dxtQuality uber -outsamedir -file %%a
)

::pause