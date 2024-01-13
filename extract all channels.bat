@echo off
magick convert %1 -channel RGBA -separate "%~d1%~p1%~n1_C.png"