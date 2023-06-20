@echo off

REM Überprüfen, ob ImageMagick installiert ist
magick -version > nul 2>&1
if %errorlevel% neq 0 (
    echo ImageMagick ist nicht installiert oder nicht im Systempfad gefunden.
    echo Stelle sicher, dass ImageMagick korrekt installiert ist.
    exit /b
)

cd /d %~dp1
magick mogrify -format jpg -quality 90% *.heic
