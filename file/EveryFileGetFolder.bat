@echo off
setlocal enabledelayedexpansion

set "sourceFolder=%~1"

if "%sourceFolder%"=="" (
    echo Bitte ziehe einen Ordner auf diese Batch-Datei.
    pause
    exit /b
)

for %%F in ("%sourceFolder%\*.*") do (
    set "filename=%%~nF"
    mkdir "%sourceFolder%\!filename!"
    move "%%F" "%sourceFolder%\!filename!\"
)

echo Ordnererstellung abgeschlossen.

pause
