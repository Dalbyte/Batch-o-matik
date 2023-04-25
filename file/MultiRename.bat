@echo off
:again
cd /d %~dp1
if "%~1" == "" goto done

ren "%~n1%~x1" "%date:~-4%%date:~-7,2%%date:~-10,2%_%~n1-AD%~x1"

shift
goto again
:done
exit