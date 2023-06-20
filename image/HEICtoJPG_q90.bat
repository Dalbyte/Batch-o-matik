@echo off
cd /d %~dp1
magick mogrify -format jpg -quality 90% *.heic
