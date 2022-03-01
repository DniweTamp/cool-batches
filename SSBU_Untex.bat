@echo off
title Smash Texture Adjustment
FOR %%a IN (%*) DO (
    echo Adjusting: %%~na%%~xa
    magick %%a -channel RGB +level 1,138.59%% "%%~da%%~pa%%~na_col.png"
    magick "%%~da%%~pa%%~na_col.png" -channel RGB -level 0%%,100%%,0.722  "%%~da%%~pa%%~na_col.png"
)
