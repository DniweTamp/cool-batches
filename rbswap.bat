@echo off

setlocal EnableDelayedExpansion
for %%a in (%*) do (
	echo Editing %%~na%%~xa
	magick convert %%a -separate -swap 0,2 -combine "%%~da%%~pa%%~na_br.png"
)
::pause