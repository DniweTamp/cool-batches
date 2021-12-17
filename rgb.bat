@echo off
title Assume RGB 

FOR %%a IN (%*) DO (
    echo Converting %%~na%%~xa
	magick %%a -set colorspace sRGB -colorspace RGB -set colorspace sRGB "%%~pa%%~na_rgb.png"
)

::pause