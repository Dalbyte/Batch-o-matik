@echo off
setlocal enabledelayedexpansion

echo Bitte geben Sie einen Namen fuer die Gruppe ein:
set /p string=
if not defined string goto :eof

echo Gib die gewünschte Dateiendung ein (z.B. mp3, wav):
set /p extension=
if not defined extension goto :eof

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

ffmpeg -i "concat:!inputList!" -c:a copy "%date:~-4%%date:~-7,2%%date:~-10,2%_%string%_group.%extension%"

endlocal