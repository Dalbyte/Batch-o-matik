@echo off
:again
cd /d %~dp1
if "%~1" == "" goto done

:: https://superuser.com/questions/1608327/ffmpeg-boomerang-effect-to-gif

::ffmpeg -i "%~n1%~x1" -filter_complex "fps=10,scale=480:-1:flags=lanczos,split[s0][s1];[s0]palettegen=max_colors=32[p];[s1][p]paletteuse=dither=bayer" "%~n1-small.gif"

:: Resolution 600 with fps=10
:: ffmpeg -i "%~n1%~x1" -filter_complex "[0]scale=600:-1,reverse[r];[0][r]concat=n=2:v=1:a=0,fps=10,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" "%~n1-pingpong-small.gif"
ffmpeg -i "%~n1%~x1" -filter_complex "reverse[r];[0][r]concat=n=2:v=1:a=0,fps=10,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" "%~n1-pingpong-small.gif"

shift
goto again
:done
exit