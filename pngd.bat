@echo off
title Any texture to PNG Conversion
call paths.bat

FOR %%a IN (%*) DO (
    echo Converting %%~na%%~xa
    "%noesis%" ?cmode %%a "%%~pa%%~na.png"
    del %%a
)

::pause