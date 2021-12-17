@echo off
title Assume sRGB 

FOR %%a IN (%*) DO (
    echo Converting %%~na%%~xa
	magick %%a -set colorspace RGB -colorspace sRGB "%%~pa%%~na_srgb.png"
)

::pause