@echo off
:again
cd /d %~dp1
if "%~1" == "" goto done

ffmpeg -i "%~n1%~x1" -vcodec copy -an "%~n1_noAudio%~x1"

shift
goto again
:done
exit