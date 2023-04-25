@echo off
cd /d %~p1

ren "%~n1%~x1" "%date:~-4%%date:~-7,2%%date:~-10,2%_%~n1-AD%~x1"

exit