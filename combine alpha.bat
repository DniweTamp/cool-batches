@echo off
::first image should be color, second should be alpha

magick convert %1 %2 -alpha off -compose CopyOpacity -composite "%~d1%~p1%~n1_composite.png"