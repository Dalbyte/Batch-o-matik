@echo off
:again
cd /d %~dp1
if "%~1" == "" goto done

magick convert -density 90 "%~n1%~x1" -rotate 0.5 -attenuate 0.15 +noise Multiplicative -sharpen 0x1.0 "%~n1_scan.pdf"

shift
goto again
:done
exit