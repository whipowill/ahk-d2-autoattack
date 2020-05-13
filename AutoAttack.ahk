#SingleInstance
#InstallKeybdHook
#InstallMouseHook

SetTimer, MoveTimer, 100
return

MoveTimer:
if GetKeyState("CapsLock", "T")
{
    GetKeyState, state, Space
    if state = D
    {
        SetKeyDelay, 10, 10
        Click Down
        Click Up
    }
}
return