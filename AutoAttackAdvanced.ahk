; =================================================
; AutoAttack for Diablo II
; by whipowill
; =================================================
; - Press CAPSLOCK to activate the script.
; - Press NUMLOCK to activate Whirlwind mode (will hold ALT while using Whirlwind).
; - Press ALT for quickly moving items from inventory to stash.
; - Hold SPACEBAR to move and attack.

#SingleInstance
#InstallKeybdHook
#InstallMouseHook

is_active := 0
return

is_whirlwind := 0
return

; -------------------------------------------------
; Press CAPSLOCK to enable the script.
; -------------------------------------------------
CapsLock::
    is_active := !is_active
    is_whirlwind = 0

    If (WinActive("Diablo II"))
    {
        if (!is_active)
        {
            SetTimer, MoveTimer, Off

            SplashTextOn, , , Autoattack is OFF.
            Sleep, 1000
            SplashTextOff
        }
        else
        {
            SetTimer, MoveTimer, 100

            SplashTextOn, , , Autoattack is ON.
            Sleep, 1000
            SplashTextOff
        }
    }
return

; -------------------------------------------------
; Disable the script when pressing ENTER (chat detection).
; -------------------------------------------------
Enter::
    If (WinActive("Diablo II"))
    {
        if (is_active)
        {
            SetTimer, MoveTimer, Off
        }
        else
        {
            SetTimer, MoveTimer, 100
        }

        is_active := !is_active
    }

    Send {Enter}
return

; -------------------------------------------------
; Hold SPACEBAR to make repeated mouse clicks.
; -------------------------------------------------
MoveTimer:
    If (WinActive("Diablo II"))
    {
        GetKeyState, state, Space
        if state = D
        {
            Click
        }
    }
return

; -------------------------------------------------
; Make right mouse button also hold ALT (Whirlwind).
; -------------------------------------------------
NumLock::
    If (WinActive("Diablo II"))
    {
        if (is_active)
        {
            is_whirlwind := !is_whirlwind

            if (!is_whirlwind)
            {
                SplashTextOn, , , Whirlwind mode is OFF.
                Sleep, 1000
                SplashTextOff
            }
            else
            {
                SplashTextOn, , , Whirlwind mode is ON.
                Sleep, 1000
                SplashTextOff
            }
        }
    }
return
#If is_whirlwind
~RButton::Alt
#If

; -------------------------------------------------
; Make ALT also press CONTROL (easy stash swap).
; -------------------------------------------------
~Alt::Control