@echo off

:again
cd /d %~dp1
if "%~1" == "" goto done
    set creationDate=%~t1
    rem echo %creationDate%
    set creationDate=%creationDate:~6,4%%creationDate:~3,2%%creationDate:~0,2%
    rem echo %creationDate%
    rem echo %~n1%~x1
    ren "%~n1%~x1" "%creationDate%_%~n1%~x1"
shift
goto again
:done
rem pause
exit
