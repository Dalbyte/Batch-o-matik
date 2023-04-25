@echo off
:again
cd /d %~dp1
if "%~1" == "" goto done

gltf-transform etc1s "%~n1%~x1" "%~n1-etc1s.glb" & gltf-transform draco "%~n1-etc1s.glb" "%~n1-etc1s+draco.glb"

shift
goto again
:done
