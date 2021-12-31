@echo off
magick convert %1 -channel R -separate "%~d1%~p1%~n1_R.png"
magick convert %1 -channel G -separate "%~d1%~p1%~n1_G.png"
magick convert %1 -channel B -separate "%~d1%~p1%~n1_B.png"
magick convert %1 -channel A -separate "%~d1%~p1%~n1_A.png"