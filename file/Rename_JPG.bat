@echo off
:again
cd /d %~dp1
if "%~1" == "" goto done

setlocal enabledelayedexpansion

set i=1001
for /f "tokens=*" %%a in ('dir /b *.jpg') do (
  set filename=%%a
  set newname=0000!i!
  set newname=!newname:~-4!
  ren "!filename!" "fuenf.!newname!.jpg"
  set /a i+=1
)

echo Umbenennen abgeschlossen.

shift
goto again
:done
exit
