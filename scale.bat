@echo off
title Scale PNG
call paths.bat

FOR %%a IN (%*) DO (
    echo Scaling %%~na%%~xa
    if not exist "%%~pa@128" mkdir "%%~pa@128"
    if not exist "%%~pa@256" mkdir "%%~pa@256"
    if not exist "%%~pa@512" mkdir "%%~pa@512"
    if not exist "%%~pa@1024" mkdir "%%~pa@1024"
    convert %%a -resize 128x128 "%%~pa@128\%%~na.png"
    convert %%a -resize 256x256 "%%~pa@256\%%~na.png"
    convert %%a -resize 512x512 "%%~pa@512\%%~na.png"
    convert %%a -resize 1024x1024 "%%~pa@1024\%%~na.png"
)

::pause