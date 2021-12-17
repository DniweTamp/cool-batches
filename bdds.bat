@echo off
title Any texture to DDS Conversion (Compatible with P5R)

:: Requires you to have ImageMagick installed
:: for checking image alpha

::paths
call paths.bat

setlocal EnableDelayedExpansion
FOR %%a IN (%*) DO (
    echo Converting %%~na%%~xa
    %NEWNVTT% %%a -f 18 -q 3 -o "%%~da%%~pa%%~na.dds"
    identify -format %%[opaque] "%%~da%%~pa%%~na.dds" > tmpFile
    set /p alpha= < tmpFile
    del tmpFile
    if "!alpha!"=="False" set bc=-bc3
    if "!alpha!"=="True" set bc=-bc1  
    "%nvtt%" !bc! "%%~da%%~pa%%~na.dds"
)

::pause