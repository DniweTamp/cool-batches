@echo off
title P5S Texture Adjustment
FOR %%a IN (%*) DO (
	echo Editing %%~na%%~xa
	magick %%a -separate "%%~da%%~pa%%~na_temp.png"
	:: Multiply Green and Red channel, to use for rim light mask (alpha) in P5
	magick "%%~da%%~pa%%~na_temp-0.png" "%%~da%%~pa%%~na_temp-1.png" -compose Multiply -composite "%%~da%%~pa%%~na_alpha.png"
	magick "%%~da%%~pa%%~na_temp-0.png" -negate "%%~da%%~pa%%~na_temp-0.png"
	magick "%%~da%%~pa%%~na_temp-0.png" "%%~da%%~pa%%~na_alpha.png" -alpha off -compose CopyOpacity -composite "%%~da%%~pa%%~na_sh_ed.png"
	del "%%~da%%~pa%%~na_temp-0.png"
	del "%%~da%%~pa%%~na_temp-1.png"
	del "%%~da%%~pa%%~na_temp-2.png"
	del "%%~da%%~pa%%~na_temp-3.png"
	del "%%~da%%~pa%%~na_alpha.png"
)
::pause