@echo off
title P5S Texture Adjustment
FOR %%a IN (%*) DO (
    echo Adjusting: %%~na%%~xa
	convert %%a -channel RGB -negate -alpha off -set colorspace Gray -separate -average -level 0%%,100%%,5.7 "%%~pa%%~na_sh.png"
	convert "%%~pa%%~na_sh.png" -fill white -colorize 100 "%%~pa%%~na_wh.png"
	convert "%%~pa%%~na_sh.png" -fill black -colorize 100 "%%~pa%%~na_bl.png"
	convert "%%~pa%%~na_bl.png" "%%~pa%%~na_wh.png" "%%~pa%%~na_sh.png" -combine "%%~pa%%~na_p5s.png"
	del "%%~pa%%~na_sh.png"
	del "%%~pa%%~na_bl.png"
	del "%%~pa%%~na_wh.png"
)
