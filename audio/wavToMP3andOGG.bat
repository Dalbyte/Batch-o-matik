@echo off

REM Definiere die gültigen Codecs und ihre Dateierweiterungen als Arrays
SETLOCAL EnableDelayedExpansion

SET Codecs[0]=libmp3lame
SET Codecs[1]=libvorbis

SET Extensions[0]=mp3
SET Extensions[1]=ogg

SET Bitrates=128k 192k
SET VBR_Quality=5 6

:check_files
if "%~1" == "" (
  echo Keine Dateien zum Konvertieren gefunden.
  pause
  exit
)

REM Schleife durch alle übergebenen Dateien
:loop_files
cd /d "%~dp1"
if "%~1" == "" goto done

REM Schleife über den Index der Codecs
for /L %%i in (0,1,2) do (

  REM Hole den Codec und die passende Dateierweiterung anhand des Index
  set "codec=!Codecs[%%i]!"
  set "extension=!Extensions[%%i]!"

  REM Hole den Dateinamen ohne Erweiterung (nur den Namen)
  set "filename=%~n1"

  REM Schleife durch alle CBR-Bitraten
  for %%B in (%Bitrates%) do (
    echo Konvertiere "%~nx1" zu "!filename!_!codec!-CBR-bit%%~B.!extension!"...
    ffmpeg -i "%~nx1" -c:a !codec! -b:a %%B "!filename!_!codec!-CBR-bit%%~B.!extension!"
  )

  REM Schleife durch alle VBR-Qualitätsstufen (nur für nicht-Opus-Codecs)
  if "!codec!" neq "libopus" (
    for %%Q in (%VBR_Quality%) do (
      echo Konvertiere "%~nx1" zu "!filename!_!codec!-VBR-quality%%Q.!extension!"...
      ffmpeg -i "%~nx1" -c:a !codec! -q:a %%Q "!filename!_!codec!-VBR-quality%%Q.!extension!"
    )
  )
)

shift
goto loop_files

:done
echo Konvertierung abgeschlossen.
pause
exit
