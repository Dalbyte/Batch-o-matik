@echo off
setlocal enabledelayedexpansion
cd /d %~dp1

set /p prefix="Bitte geben Sie ein Präfix ein (oder drücken Sie Enter, um keines zu setzen): "
if not defined prefix (
    set "prefix="
)

for %%a in (%*) do (
    set "output="
    set "filename=%%~nxa"
    set "filesize=%%~za"
    set /a "filesizeMB=filesize / 1048576"
    set /a "filesizeKB=(filesize %% 1048576) / 1024"
    if !filesize! GEQ 1073741824 (
        set /a "filesizeGB=filesize / 1073741824"
        set /a "filesizeMB=(filesize %% 1073741824) / 1048576"
        set "output=!prefix!!filename! (!filesizeGB!.!filesizeMB:~0,2! GB)"
        echo !output! >> output.txt
    ) else (
        if !filesize! GEQ 1048576 (
            set /a "filesizeMB=filesize / 1048576"
            set /a "filesizeKB=(filesize %% 1048576) / 1024"
            set "output=!prefix!!filename! (!filesizeMB! MB)"
            echo !output! >> output.txt
        ) else (
            set "output=!prefix!!filename! (!filesizeKB! KB)"
            echo !output! >> output.txt
        )
    )
)

echo Text wurde erfolgreich erstellt und in "output.txt" gespeichert.
pause