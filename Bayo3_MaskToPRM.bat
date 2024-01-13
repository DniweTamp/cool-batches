@echo off
setlocal enabledelayedexpansion

magick %1 -separate -quality 10 "%~n1.png"
magick %2 -separate -quality 10 "%~n2.png"

magick "%~n1-0.png" "%~n2-3.png" "%~n2-2.png" -combine Bayo3_PRM.png


for %%i in (0,1,2,3) do (
    del "%~n1-%%i.png"
    del "%~n2-%%i.png"
)
