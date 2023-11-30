@echo off
setlocal enabledelayedexpansion

echo Bitte geben Sie einen Namen fuer die Gruppe ein:
set /p string=
if not defined string goto :eof

set "inputList="

:loop
cd /d %~dp1
if "%~1" == "" goto :done

set "inputList=!inputList!%~n1%~x1|"
shift
goto loop

:done
rem Entferne das letzte Pipe-Zeichen am Ende der Liste
set "inputList=!inputList:~0,-1!"

ffmpeg -i "concat:!inputList!" -vf format=yuv420p -codec:v libx264 -crf 30 "%date:~-4%%date:~-7,2%%date:~-10,2%_%string%_group.mp4"

endlocal
