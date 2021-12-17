@echo off
title Any texture to DDS Conversion

::paths
call paths.bat

setlocal EnableDelayedExpansion
FOR %%a IN (%*) DO (
    echo Converting %%~na%%~xa
    %NEWNVTT% %%a -f 15 -q 3 -o "%%~da%%~pa%%~na.dds"
)

::pause