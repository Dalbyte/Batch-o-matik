@echo off
:again
cd /d %~dp1
if "%~1" == "" goto done

magick convert -density 90 "%~n1%~x1" -rotate 0.5 -attenuate 0.2 +noise Multiplicative -colorspace Gray "%~n1_scan.pdf"

shift
goto again
:done
exit