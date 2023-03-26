SendMode Input
SetWorkingDir %A_ScriptDir%

; Define initial state of Toggle
Toggle := 0

; Toggle number row and F key mode with CapsLock
CapsLock::
    Toggle := !Toggle
    If (Toggle) {
        ; Map number row keys to corresponding F keys
        Hotkey, 1, F1, On
        Hotkey, 2, F2, On
        Hotkey, 3, F3, On
        Hotkey, 4, F4, On
        Hotkey, 5, F5, On
        Hotkey, 6, F6, On
        Hotkey, 7, F7, On
        Hotkey, 8, F8, On
        Hotkey, 9, F9, On
        Hotkey, 0, F10, On
        
    } Else {
        ; Disable number row hotkeys when toggled off
        Hotkey, 1, F1, Off
        Hotkey, 2, F2, Off
        Hotkey, 3, F3, Off
        Hotkey, 4, F4, Off
        Hotkey, 5, F5, Off
        Hotkey, 6, F6, Off
        Hotkey, 7, F7, Off
        Hotkey, 8, F8, Off
        Hotkey, 9, F9, Off
        Hotkey, 0, F10, Off
    }
    Gosub, RemoveToolTip
    Return

F1::Send {F1}
F2::Send {F2}
F3::Send {F3}
F4::Send {F4}
F5::Send {F5}
F6::Send {F6}
F7::Send {F7}
F8::Send {F8}
F9::Send {F9}
F10::Send {F10}

; Display tooltip to indicate toggle status at cursor position
RemoveToolTip:
    MouseGetPos, xpos, ypos
    ToolTip % (Toggle ? "On" : "Off"), xpos+20, ypos+20
    SetTimer, HideToolTip, 1000
    return

HideToolTip:
    ToolTip
    SetTimer, HideToolTip, Off
    return

