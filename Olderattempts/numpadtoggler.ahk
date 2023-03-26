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
    Toggle := !Toggle
    If (Toggle) {
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
