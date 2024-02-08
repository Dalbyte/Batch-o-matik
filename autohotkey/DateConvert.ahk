#Persistent
return

; Setzen Sie die Plus-Taste als Hotkey
F17::
    ; Speichern Sie den aktuellen Inhalt der Zwischenablage
    ClipSaved := ClipboardAll

    ; Ersetzen Sie das Datum in der Zwischenablage durch das gewünschte Format
    Clipboard := RegExReplace(Clipboard, "(\d{2})[. ](\d{2})[. ](\d{4})", "$3$2$1_")

    ; Wenn die Zwischenablage geändert wurde
    if (Clipboard != ClipSaved) {
        ; Aktualisieren Sie die Zwischenablage mit dem neuen Text
        Clipboard := Clipboard
        SendInput, ^v
    }
return

; Setzen Sie die F19-Taste als Hotkey
F19::
  ; Senden Sie die Tastenkombination für "Neuer Ordner" in Windows Explorer
  ; SendInput, ^+n

    ; Senden Sie die Tastenkombination Windows + Shift + T
  SendInput, #+t
return


; Setzen Sie die F24-Taste als Hotkey
+::
    ; Speichern Sie den aktuellen Inhalt der Zwischenablage
    ClipSaved := ClipboardAll

    ; Entfernen Sie alle Leerzeichen und machen Sie den nachfolgenden Buchstaben groß
    Clipboard := CamelCase(Clipboard)

    ; Wenn die Zwischenablage geändert wurde
    if (Clipboard != ClipSaved) {
        ; Aktualisieren Sie die Zwischenablage mit dem neuen Text
        Clipboard := Clipboard
        SendInput, ^v
    }
return

CamelCase(str) {
    VarSetCapacity(result, StrLen(str)*2)
    words := StrSplit(str, " ")
    for each, word in words
    {
        StringUpper, temp, word, T
        result .= temp
    }
    return result
}