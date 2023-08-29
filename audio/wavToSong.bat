REM @echo off
cd /d %~dp1
mkdir mp3

:again
cd /d %~dp1
if "%~1" == "" goto done

ffmpeg -i "%~n1%~x1" -c:a libmp3lame -q:a 6 "./mp3/%~n1.mp3"

shift
goto again
:done
REM exit