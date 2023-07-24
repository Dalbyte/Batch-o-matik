@echo off
echo %CD%
echo %~dp0
cd /d %~dp1
mkdir small

:again
cd /d %~dp1
if "%~1" == "" goto done
	cjpeg-static -quality 70 "%~n1%~x1" > "./small/%~n1_small.jpg"
shift
goto again
:done
exit