@echo off
:again
cd /d %~dp1
if "%~1" == "" goto done

ffmpeg -i "%~n1%~x1" -vf format=yuv420p -codec:v libx265 -crf 34 "%~n1_h265_small.mp4"


shift
goto again
:done
exit