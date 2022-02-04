@echo off
title P5S Texture Adjustment
FOR %%a IN (%*) DO (
    echo Adjusting: %%~na%%~xa
	convert %%a -channel B -separate "%%~pa%%~na_B.png"
	magick "%%~pa%%~na_B.png" -level 0%%,100%%,0.2 "%%~pa%%~na_B.png"
	convert "%%~pa%%~na_B.png" -channel RGB -negate "%%~pa%%~na_sh.png"
	convert "%%~pa%%~na_sh.png" "%%~pa%%~na_B.png" -alpha off -compose CopyOpacity -composite "%%~pa%%~na_sh.png"
	del "%%~pa%%~na_B.png"
)