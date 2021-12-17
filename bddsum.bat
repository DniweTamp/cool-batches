@echo off
title Any texture to DDS Conversion (Compatible with P5R)

:: Requires you to have ImageMagick installed
:: for checking image alpha

::paths
call paths.bat

setlocal EnableDelayedExpansion
FOR %%a IN (%*) DO (
    echo Converting %%~na%%~xa
    "%noesis%" ?cmode %%a "%%~pa%%~na.tga"
    "%nvtt%" -nomips -rgb "%%~pa%%~na.tga"
    del "%%~pa%%~na.tga"
)

::pause