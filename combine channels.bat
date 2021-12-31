@echo off
set /p "R=Image for Red channel: "
set /p "G=Image for Green channel: "
set /p "B=Image for Blue channel: "
set /p "A=Image for Alpha channel: "

magick convert %R% %G% %B% %A% -combine magick_combined.png