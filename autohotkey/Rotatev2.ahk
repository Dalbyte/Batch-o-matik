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



SpinDir := 0 ; Bool Variable für Invertscroll

ä::
Loop
{   
    
ScrollSpeed := 1 ;  Geschwindigkeit Variable
SleepSpeed := 100 ; Pause Variable


    if(SpinDir){
        SendInput {WheelUp %ScrollSpeed%}
        Sleep, SleepSpeed ; Pause einstellen
    }
    else{
        SendInput {WheelDown %ScrollSpeed%}
        Sleep, SleepSpeed ; Pause einstellen
    }
    


    ; Alle Button Interaktionen wärend des Scrollens
    if GetKeyState("+", "P")
    {
        break ; Beende die Schleife
    } else If GetKeyState("Down", "P")
    {
        SpinDir = 0
    } else If GetKeyState("Up", "P")
    {
        SpinDir = 1
    }
}