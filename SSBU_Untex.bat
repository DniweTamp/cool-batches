@echo off
title Smash Texture Adjustment
FOR %%a IN (%*) DO (
    echo Adjusting: %%~na%%~xa
	convert -alpha extract %%a "%%~pa%%~na_alpha.png"
    magick %%a +level 1,138.59%% "%%~da%%~pa%%~na_col.png"
	magick "%%~da%%~pa%%~na_col.png" -level 0%%,100%%,0.722  "%%~da%%~pa%%~na_col.png"
	magick "%%~da%%~pa%%~na_col.png" "%%~pa%%~na_alpha.png" -alpha off -compose CopyOpacity -composite "%%~da%%~pa%%~na_col.png"
	del "%%~pa%%~na_alpha.png"
)
