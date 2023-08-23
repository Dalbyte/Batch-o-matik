@echo off
:again
cd /d %~dp1
if "%~1" == "" goto done

ffmpeg -v warning -i "%~n1%~x1"  -vf "fps=8,scale=400:-1:flags=lanczos,palettegen" -y "%~n1-color.png"
ffmpeg -v warning -i "%~n1%~x1"  -i "%~n1-color.png" -lavfi "fps=8,scale=600:-1:flags=lanczos [x]; [x][1:v] paletteuse" -y "%~n1-600_small.gif"
del /q "%~n1-color.png"

shift
goto again
:done
exit