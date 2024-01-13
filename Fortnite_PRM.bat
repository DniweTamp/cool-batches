@echo off
setlocal enabledelayedexpansion


::1 is S, 2 is M
magick %1 -separate -quality 10 "%~n1.png"
magick %2 -separate -quality 10 "%~n2.png"

magick "%~n1-1.png" "%~n1-2.png" "%~n2-0.png" "%~n1-0.png" -combine "%~d1%~p1%~n1_PRM.png"


for %%i in (0,1,2,3) do (
    del "%~n1-%%i.png"
    del "%~n2-%%i.png"
)
