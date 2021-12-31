@echo off
title Gamma Conversion
set /p "gamma=Gamma: "
convert %1 -gamma %gamma% "%~p1%~n1_gamma.png"