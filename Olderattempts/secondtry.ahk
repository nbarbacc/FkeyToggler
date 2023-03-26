SendMode Input
SetWorkingDir %A_ScriptDir%

; Map number row keys to corresponding F keys
1::F1
2::F2
3::F3
4::F4
5::F5
6::F6
7::F7
8::F8
9::F9
0::F10

; Toggle number row and F key mode with Caps Lock
CapsLock::
    Toggle := (Toggle = "") ? 0 : Toggle
    If (Toggle) {
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
        Send {Blind}{Fn down}{m down}{m up}{Fn up}
    } Else {
        1::
        2::
        3::
        4::
        5::
        6::
        7::
        8::
        9::
        0::
    }
    SetCapsLockState, off
Return

; Change keyboard color with Fn+m
#m::
    Send {Blind}{Fn down}{m down}{m up}{Fn up}
Return
