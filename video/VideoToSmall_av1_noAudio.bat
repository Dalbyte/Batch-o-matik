@echo off
:again
cd /d %~dp1
if "%~1" == "" goto done


REM ffmpeg -i "%~n1%~x1" -vf format=yuv420p -codec:v libx264 -crf 30 "%~n1_h264_small.mp4"
REM ffmpeg convert to webm av1
ffmpeg -i "%~n1%~x1" -strict -2 -vf format=yuv420p -cpu-used 8 -codec:v libaom-av1 -crf 30 -an "%~n1_av1_small.webm"

shift
goto again
:done
exit