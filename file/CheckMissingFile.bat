@echo off
setlocal enabledelayedexpansion

set "folder1=%~1"
set "folder2=%~2"

if "%folder1%" == "" (
    echo Bitte den ersten Ordner per Drag-and-Drop auf das Skript ziehen.
    pause
    exit /b
)

if "%folder2%" == "" (
    echo Bitte den zweiten Ordner per Drag-and-Drop auf das Skript ziehen.
    pause
    exit /b
)

for %%F in ("%folder1%\*.*") do (
    set "filename=%%~nF"
    if not exist "%folder2%\!filename!.*" (
        echo !filename! fehlt in %folder2%
    )
)

pause
endlocal
