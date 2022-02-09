@echo off
title P5S Texture Adjustment
FOR %%a IN (%*) DO (
    echo Adjusting: %%~na%%~xa
    convert -alpha extract %%a "%%~pa%%~na_alp.png"
    convert "%%~pa%%~na_alp.png" -channel RGB -negate -alpha off -set colorspace Gray -separate -average "%%~pa%%~na_alp.png"
    convert %%a -channel RGB -negate -alpha off -set colorspace Gray -separate -average -brightness-contrast +50x0 "%%~pa%%~na_sh.png"
    convert "%%~pa%%~na_sh.png" -fill white -colorize 100 "%%~pa%%~na_wh.png"
    convert "%%~pa%%~na_alp.png" "%%~pa%%~na_wh.png" "%%~pa%%~na_sh.png" -combine "%%~pa%%~na_p5s.png"
    del "%%~pa%%~na_sh.png"
    del "%%~pa%%~na_alp.png"
    del "%%~pa%%~na_wh.png"
)
