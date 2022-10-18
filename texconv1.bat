@echo off
title texconv DDS Conversion

::paths
call paths.bat

setlocal EnableDelayedExpansion
FOR %%a IN (%*) DO (
    echo Converting %%~na%%~xa
    "%noesis%" ?cmode %%a "%%~da%%~pa%%~na_temp.tga"
	if exist "%%~da%%~pa%%~na.dds" del "%%~da%%~pa%%~na.dds"
	"%texconv%" -f BC1_UNORM -pow2 -dx9 -nologo -timing -bc d -y "%%~da%%~pa%%~na_temp.tga"
	ren "%%~da%%~pa%%~na_temp.dds" "%%~na.dds"
	del "%%~da%%~pa%%~na_temp.tga"
)

::pause