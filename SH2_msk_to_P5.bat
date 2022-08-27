@echo off
title SH2 mask texture to P5 specular and shadow maps conversion
FOR %%a IN (%*) DO (
    echo Adjusting: %%~na%%~xa
	magick %%a -fill white -colorize 100 "%%~da%%~pa%%~na_white.png"
	magick %%a -fill black -colorize 100 "%%~da%%~pa%%~na_black.png"
	magick %%a -channel R -separate "%%~da%%~pa%%~na_R.png"
	magick "%%~da%%~pa%%~na_white.png" "%%~da%%~pa%%~na_R.png" -compose HardLight -composite "%%~da%%~pa%%~na_sh_alpha.png"
	magick "%%~da%%~pa%%~na_black.png" "%%~da%%~pa%%~na_R.png" -compose HardLight -composite "%%~da%%~pa%%~na_sp.png"
	magick "%%~da%%~pa%%~na_sh_alpha.png" -negate "%%~da%%~pa%%~na_sh_pre.png"
	magick "%%~da%%~pa%%~na_sh_pre.png" "%%~da%%~pa%%~na_sh_alpha.png" -alpha off -compose CopyOpacity -composite "%%~da%%~pa%%~na_sh.png"
	del "%%~da%%~pa%%~na_sh_pre.png"
	del "%%~da%%~pa%%~na_sh_alpha.png"
	del "%%~da%%~pa%%~na_white.png"
	del "%%~da%%~pa%%~na_black.png"
	del "%%~da%%~pa%%~na_R.png"
)