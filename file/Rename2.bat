@echo off
:again
cd /d %~dp1
if "%~1" == "" goto done

setlocal enabledelayedexpansion

set i=1
for /f "tokens=*" %%a in ('dir /b *.png') do (
  set filename=%%a
  set newname=0000!i!
  set newname=!newname:~-4!
  ren "!filename!" "!newname!.png"
  set /a i+=1
)

echo Umbenennen abgeschlossen.

shift
goto again
:done
exit
