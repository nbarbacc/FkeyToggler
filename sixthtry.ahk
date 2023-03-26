SendMode Input
SetWorkingDir %A_ScriptDir%

; Define initial state of Toggle
Toggle := 0

; Toggle number row and F key mode with Capslock
$CapsLock::
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
    }
    Gosub, RemoveToolTip
    Return

F1:
    SendLevel 1
    Send {F1}
    Return
F2:
    SendLevel 1
    Send {F2}
    Return
F3:
    SendLevel 1
    Send {F3}
    Return
F4:
    SendLevel 1
    Send {F4}
    Return
F5:
    SendLevel 1
    Send {F5}
    Return
F6:
    SendLevel 1
    Send {F6}
    Return
F7:
    SendLevel 1
    Send {F7}
    Return
F8:
    SendLevel 1
    Send {F8}
    Return
F9:
    SendLevel 1
    Send {F9}
    Return

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
