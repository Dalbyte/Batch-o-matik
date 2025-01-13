@echo off

:again
cd /d %~dp1
if "%~1" == "" goto done

    for /f "tokens=* usebackq" %%i in (`powershell -command "(Get-Item '%~1').CreationTime.ToString('yyyyMMdd')"`) do set creationDate=%%i

    echo %creationDate%
    rem echo %~n1%~x1
    ren "%~n1%~x1" "%creationDate%_%~n1%~x1"

shift
goto again

:done
pause
exit
