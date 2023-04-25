@echo off
:again
cd /d %~dp1
if "%~1" == "" goto done

ffmpeg -framerate 6 -i %%04d.png -c:v libx264 -r 6 output.mp4

shift
goto again
:done
exit
