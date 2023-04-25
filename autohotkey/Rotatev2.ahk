#::
Click, down, left
Loop
{
    MouseGetPos, startX, startY
    MouseMove, -2, 0, 10, R
    
    if (startX < 100) ; Wenn die X-Position der Maus kleiner als 100 ist für Bildschirm
    {   
        Click, up, left
        MouseMove, 2500, startY, 0 ; Setze die Maus auf die X-Position 2500 zurück
        Click, down, left
    }

    if GetKeyState("+", "P")
    {
        break ; Beende die Schleife
    }
}
Click, up, left
return

