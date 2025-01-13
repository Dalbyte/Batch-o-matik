@echo off
:again
cd /d %~dp1
if "%~1" == "" goto done

ffmpeg -i "%~n1%~x1" -vf format=yuv420p -c:v libsvtav1 -b:v 0 -crf 28 -preset 8 "%~n1_av1_hq_small.mkv"

shift
goto again
:done
exit