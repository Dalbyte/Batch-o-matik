@echo off

REM Definiere die gueltigen Codecs und ihre Dateierweiterungen als Arrays
SETLOCAL EnableDelayedExpansion

SET "Codecs[0]=libmp3lame"
SET "Codecs[1]=libvorbis"
SET "Codecs[2]=libopus"

SET "Extensions[0]=mp3"
SET "Extensions[1]=ogg"
SET "Extensions[2]=opus"

SET "Bitrates=32k 64k 128k 192k"
SET "VBR_Quality=2 4 5 6"

REM Abfrage der Abtastrate
echo Bitte wähle eine Abtastrate:
echo 1 - 44100 Hz
echo 2 - 48000 Hz
choice /C 12 /N
if "%errorlevel%"=="1" (
  set "SampleRate=44100"
) else if "%errorlevel%"=="2" (
  set "SampleRate=48000"
) else (
  echo Ungueltige Auswahl. Das Skript wird beendet.
  pause
  exit /b
)

:check_files
if "%~1" == "" (
  echo Keine Dateien zum Konvertieren gefunden.
  pause
  exit
)

REM Schleife durch alle uebergebenen Dateien
:loop_files
cd /d "%~dp1"
if "%~1" == "" goto done

REM Schleife ueber den Index der Codecs
for /L %%i in (0,1,2) do (

  REM Hole den Codec und die passende Dateierweiterung anhand des Index
  set "codec=!Codecs[%%i]!"
  set "extension=!Extensions[%%i]!"

  REM Hole den Dateinamen ohne Erweiterung (nur den Namen)
  set "filename=%~n1"


  REM Schleife durch alle CBR-Bitraten
  for %%B in (%Bitrates%) do (
    REM Schreibe %%B in eine neue Variable bitrate
    set "bitrate=%%B"
    echo Konvertiere "%~nx1" zu "!filename!_!codec!-!SampleRate!Hz-CBR-bit!bitrate!.!extension!"
    ffmpeg -i "%~nx1" -c:a !codec! -b:a !bitrate! -ar !SampleRate! "!filename!_!codec!-!SampleRate!Hz-CBR-bit!bitrate!.!extension!"

    REM Schleife fuer die Mono-Konvertierung
    echo Konvertiere "%~nx1" zu "!filename!_!codec!-!SampleRate!Hz-CBR-bit!bitrate!-mono.!extension!" (Mono)
    ffmpeg -i "%~nx1" -c:a !codec! -b:a !bitrate! -ac 1 -ar !SampleRate! "!filename!_!codec!-!SampleRate!Hz-CBR-bit!bitrate!-mono.!extension!"
  )

  REM Schleife durch alle VBR-Qualitätsstufen (nur fuer nicht-Opus-Codecs)
    for %%Q in (%VBR_Quality%) do (
      REM Schreibe %%Q in eine neue Variable quality
      set "quality=%%Q"
      echo Konvertiere "%~nx1" zu "!filename!_!codec!-!SampleRate!Hz-VBR-quality!quality!.!extension!"
      ffmpeg -i "%~nx1" -c:a !codec! -q:a !quality! -ar !SampleRate! "!filename!_!codec!-!SampleRate!Hz-VBR-quality!quality!.!extension!"

      REM Schleife fuer die Mono-Konvertierung
      echo Konvertiere "%~nx1" zu "!filename!_!codec!-!SampleRate!Hz-VBR-quality!quality!-mono.!extension!" (Mono)
      ffmpeg -i "%~nx1" -c:a !codec! -q:a !quality! -ac 1 -ar !SampleRate! "!filename!_!codec!-!SampleRate!Hz-VBR-quality!quality!-mono.!extension!"
    )

  REM ueberpruefe, ob Opus ausgeschlossen werden soll (44100 Hz)
  if "%SampleRate%"=="44100" (
    if "!codec!"=="libopus" (
      echo Opus unterstuetzt keine Abtastrate von 44100 Hz. ueberspringe Codec: !codec!
      continue
    )
  )
)

:done
echo Konvertierung abgeschlossen.
pause
exit
