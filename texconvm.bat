@echo off
title texconv DDS Conversion

:: Requires you to have ImageMagick installed
:: for checking image alpha

::paths
call paths.bat

setlocal EnableDelayedExpansion
FOR %%a IN (%*) DO (
    echo Converting %%~na%%~xa
    "%noesis%" ?cmode %%a "%%~da%%~pa%%~na_temp.tga"
    identify -format %%[opaque] "%%~da%%~pa%%~na_temp.tga" > tmpFile
    set /p alpha= < tmpFile
    del tmpFile
    if "!alpha!"=="False" set bc=BC3_UNORM
    if "!alpha!"=="True" set bc=BC1_UNORM
	if exist "%%~da%%~pa%%~na.dds" del "%%~da%%~pa%%~na.dds"
	"%texconv%" -f !bc! -pow2 -dx9 -nologo -timing -bc d -m 1 -y "%%~da%%~pa%%~na_temp.tga"
	ren "%%~da%%~pa%%~na_temp.dds" "%%~na.dds"
	del "%%~da%%~pa%%~na_temp.tga"
)

::pause