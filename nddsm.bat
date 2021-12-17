@echo off
title Any texture to DDS Conversion

:: Requires you to have ImageMagick installed
:: for checking image alpha

::paths
call paths.bat

setlocal EnableDelayedExpansion
FOR %%a IN (%*) DO (
    echo Converting %%~na%%~xa
    identify -format %%[opaque] %%a > tmpFile
    set /p alpha= < tmpFile
    del tmpFile
    if "!alpha!"=="False" set bc=18
    if "!alpha!"=="True" set bc=15
    %NEWNVTT% %%a -f !bc! -q 3 --no-mips -o "%%~da%%~pa%%~na.dds"
)

::pause