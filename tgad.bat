@echo off
title Any texture to TGA Conversion
call paths.bat

FOR %%a IN (%*) DO (
    echo Converting %%~na%%~xa
    "%noesis%" ?cmode %%a "%%~pa%%~na.tga"
    del %%a
)

::pause