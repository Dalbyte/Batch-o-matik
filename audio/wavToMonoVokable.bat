REM @echo off
:again
cd /d %~dp1
if "%~1" == "" goto done

ffmpeg -i "%~n1%~x1" -c:a libmp3lame -q:a 4 -ac 1 "./mono/%~n1.mp3"

shift
goto again
:done
REM exit