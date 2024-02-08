@echo off
setlocal enabledelayedexpansion

rem Prüfen, ob zwei Dateien per Drag-and-Drop übergeben wurden
if "%~2"=="" (
    echo Bitte zwei PDF-Dateien per Drag-and-Drop auf dieses Skript ziehen.
    pause
    exit /b
)
cd /d %~dp1

rem Konvertieren von Windows-Pfaden in WSL-Pfade
set "wsl_path1=%~n1%~x1"
set "wsl_path2=%~n2%~x2"

rem Bestimmen des Ausgabepfads
set "output_path=%~n1_merge%~n1.pdf"

rem Ausführen des pdftk-Befehls in WSL
wsl pdftk A="%wsl_path1%" B="%wsl_path2%" shuffle A Bend-1 output "%output_path%"

exit
