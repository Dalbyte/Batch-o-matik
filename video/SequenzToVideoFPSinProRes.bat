@echo off
cd /d %~dp1

:again
echo Bitte geben Sie eine Ganzzahl fuer FPS ein:
set /p number=
if not defined number goto again


:again
echo Bitte geben Sie eine Dateinamen ohne Datum ein:
set /p string=
if not defined string goto again

set datestring=%date:~-4%%date:~-7,2%%date:~-10,2%

ffmpeg -framerate %number% -i %%04d.png -c:v prores_ks -profile:v 3 "%datestring%_%string%.mov"


exit
