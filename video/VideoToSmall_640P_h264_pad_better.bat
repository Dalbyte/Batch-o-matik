@echo off
:again
cd /d %~dp1
if "%~1" == "" goto done

ffmpeg -i "%~n1%~x1" -vf "scale=-1:640,pad=width=iw+1:height=ih:x=0:y=0:color=black" -c:v libx264 -crf 24 "%~n1_h264_small.mp4"


shift
goto again
:done
exit