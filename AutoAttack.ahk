; =================================================
; AutoAttack for Diablo II
; by whipowill
; =================================================

#SingleInstance Force
#InstallKeybdHook
#InstallMouseHook

is_active := 0
Return

is_whirlwind := 0
Return

; -------------------------------------------------
; Press PageUp to enable the script.
; -------------------------------------------------
PgUp::
    is_active := !is_active
    is_whirlwind = 0

    If (!is_active)
    {
        SetTimer, MoveTimer, Off

        SplashTextOn, , , OFF
        Sleep, 1000
        SplashTextOff
    }
    else
    {
        SetTimer, MoveTimer, 100

        SplashTextOn, , , ON
        Sleep, 1000
        SplashTextOff
    }
Return

; -------------------------------------------------
; Disable the script when pressing ENTER (chat detection).
; -------------------------------------------------
Enter::
    If (is_active)
    {
        SetTimer, MoveTimer, Off
    }
    else
    {
        SetTimer, MoveTimer, 100
    }

    is_active := !is_active

    Send {Enter}
Return

; -------------------------------------------------
; Hold SPACEBAR to make repeated mouse clicks.
; -------------------------------------------------
MoveTimer:
    If (WinActive("Diablo II"))
    {
        state := GetKeyState("Space", "P")
        If (state)
        {
            SetMouseDelay -1
            Click
        }
    }
Return

; -------------------------------------------------
; Press PageDown to activate WW mode.
; -------------------------------------------------
PgDn::
    is_whirlwind := !is_whirlwind

    If (!is_whirlwind)
    {
        SplashTextOn, , , WW OFF
        Sleep, 1000
        SplashTextOff
    }
    Else
    {
        SplashTextOn, , , WW ON
        Sleep, 1000
        SplashTextOff
    }
Return

~RButton::
    If (WinActive("Diablo II"))
    {
        If (is_whirlwind)
        {
            While GetKeyState("RButton", "P")
            {
                Send {Alt down}
                Sleep 100
            }
            send {Alt up}
        }
    }
return

; -------------------------------------------------
; Make ALT also press CONTROL (easy stash swap).
; -------------------------------------------------
~Alt::Control

; -------------------------------------------------
; Make ALT also press CONTROL (easy stash swap).
; -------------------------------------------------
XButton2::Send, {Enter} leader Judah {Enter}
XButton1::Send, {Enter} move{Enter}