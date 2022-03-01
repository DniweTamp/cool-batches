@echo off
title Smash Texture Adjustment
FOR %%a IN (%*) DO (
    echo Adjusting: %%~na%%~xa
    magick %%a -channel RGB +level 1,72.16%% "%%~da%%~pa%%~na_col.png"
    magick "%%~da%%~pa%%~na_col.png" -channel RGB -level 0%%,100%%,1.385  "%%~da%%~pa%%~na_col.png"
)
