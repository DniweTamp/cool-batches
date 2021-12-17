@echo off
title Any texture to bc7 DDS Conversion

set NEWNVTT="C:\Program Files\NVIDIA Corporation\NVIDIA Texture Tools Exporter\NEWNVTT_export.exe"

FOR %%a IN (%*) DO (
    echo Converting %%~na%%~xa
    %NEWNVTT% %%a -f 23 -q 1 --no-mips -o "%%~da%%~pa%%~na.dds"
)
::pause