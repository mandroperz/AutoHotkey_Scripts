;ResetZoomMagnify
;Windows 10

;There is a bug where the lock screen is enlarged
reset_zoom()
{
    Process, Exist, Magnify.exe
    
    if ( ErrorLevel == 0 )
         return
    
    RegRead, magnification, HKEY_CURRENT_USER\SOFTWARE\Microsoft\ScreenMagnifier , Magnification
    
    if ( magnification == 100 )
        return
        
    RegWrite, REG_DWORD, HKEY_CURRENT_USER\SOFTWARE\Microsoft\ScreenMagnifier , Magnification, 100
}

;slow
reset_zoom2()
{
    Process, Exist, Magnify.exe
    
    if ( ErrorLevel == 0 )
         return
    
    RegRead, magnification, HKEY_CURRENT_USER\SOFTWARE\Microsoft\ScreenMagnifier , Magnification
    
    if ( magnification == 100 )
        return
    
    RegRead, zoomIncrement, HKEY_CURRENT_USER\SOFTWARE\Microsoft\ScreenMagnifier , ZoomIncrement
    
    value := (magnification - 100) / zoomIncrement
    
    Loop, %value%
    {
        send, #-
        Sleep, 200
    }
}

; ctrl + shift + r
^+r::reset_zoom()

; ctrl + r
^r::reset_zoom2()


