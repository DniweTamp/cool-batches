@echo off
title Any texture to bc7 DDS Conversion

call paths.bat

FOR %%a IN (%*) DO (
    echo Converting %%~na%%~xa
    %NEWNVTT% %%a -f 23 -q 1 -o "%%~da%%~pa%%~na.dds"
)

::pause