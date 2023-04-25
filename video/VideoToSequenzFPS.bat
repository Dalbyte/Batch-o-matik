@echo off
cd /d %~dp1

:again
echo Bitte geben Sie eine Ganzzahl fuer FPS ein:
set /p number=
if not defined number goto again

:again
echo Bitte geben Sie eine Prefix fuer die DateienSequenz ein:
set /p string=
if not defined string goto again

mkdir "%string%-fps-%number%"

ffmpeg -i "%~n1%~x1" -vf scale=1280:-1 -r %number% "%string%-fps-%number%/%string%-%%04d.png"

