#::
Click, down, left
Loop, 50 ; Schleifendurchläufe mit einer Pause von 10 Millisekunden = 20 Sekunden
{
    MouseGetPos, startX, startY
    MouseMove, -2, 0, 10, R
    
    if (startX < 100) ; Wenn die X-Position der Maus kleiner als 100 ist für Bildschirm
    {   
        Click, up, left
        MouseMove, 3600, startY, 0 ; Setze die Maus auf die X-Position 2500 zurück
        Click, down, left
    }
}
Click, up, left
return

