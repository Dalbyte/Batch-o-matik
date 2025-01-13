@echo off
:again
cd /d %~dp1
if "%~1" == "" goto done

ffmpeg -i "%~n1%~x1" -vf format=yuv420p -c:v libvpx-vp9 -b:v 0 -crf 40 -preset 8 -c:a libopus -b:a 128k "%~n1_webm_hq_small.webm"

shift
goto again
:done
exit