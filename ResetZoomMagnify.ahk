;ResetZoomMagnify
;Windows 10

;There is a bug where the lock screen is enlarged.
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



^r::reset_zoom()


