SendMode Input
SetWorkingDir %A_ScriptDir%



; Toggle number row and F key mode with Caps Lock
LCtrl::
    If (Toggle) {
        ; Map number row keys to corresponding F keys
        1::Send {F1}
        2::Send {F2}
        3::Send {F3}
        4::Send {F4}
        5::Send {F5}
        6::Send {F6}
        7::Send {F7}
        8::Send {F8}
        9::Send {F9}
        0::Send {F10}
        ; Change keyboard color when toggled on
        SendPlay {Blind}{Fn down}{m down}{m up}{Fn up}
    } Else {
        ; Disable number row hotkeys when toggled off
        1::1
        2::2
        3::3
        4::4
        5::5
        6::6
        7::7
        8::8
        9::9
        0::0
    }
    Send {LControl up}


; Display tooltip to indicate toggle status at cursor position
RemoveToolTip:
    MouseGetPos, xpos, ypos
    ToolTip % (Toggle ? "On" : "Off"), xpos+20, ypos+20
    SetTimer, RemoveToolTip, 1000
    return

Return


    
Return

