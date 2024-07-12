#NoEnv
SendMode Input

global target_window := ""
global last_window := ""

; Funktion um das aktive Fenster zu identifizieren und zu speichern
SetTargetWindow() {
    global target_window
    ; Aktives Fenster identifizieren
    WinGet, active_id, ID, A
    target_window := active_id
    MsgBox, Ziel-Fenster wurde festgelegt.
}

; Funktion um den Befehl an das gespeicherte Fenster zu senden
SendToTargetWindow(Keys) {
    global target_window
    global last_window
    if (target_window = "") {
        MsgBox, Bitte das Ziel-Fenster zuerst festlegen!
        return
    }
    ; Aktives Fenster identifizieren und speichern
    WinGet, last_window, ID, A
    ; Ziel-Fenster aktivieren und Befehl senden
    WinActivate, ahk_id %target_window%
    Sleep, 100 ; Kurze Pause, um sicherzustellen, dass das Fenster aktiv ist
    ControlSend,, %Keys%, ahk_id %target_window%
    ; Zurück zum ursprünglichen Fenster
    WinActivate, ahk_id %last_window%
}

; Hotkey zum Festlegen des Ziel-Fensters (Ctrl + Shift + #)
^+#::
    SetTargetWindow()
return

; Hotkey für Pause/Play
F18::
    SendToTargetWindow("{Space}")
return

; Hotkey für 10 Sekunden zurückspulen
F17::
    SendToTargetWindow("{Left}")
return

; Hotkey für 10 Sekunden vorspulen
F19::
    SendToTargetWindow("{Right}")
return
