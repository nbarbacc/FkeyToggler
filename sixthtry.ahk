global Toggle := 0
global KeyMappingsFile := "key_mappings.txt"
global FKeys := ["F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9"]


SetCapsLockState, AlwaysOff
SendMode Input
SetWorkingDir %A_ScriptDir%

LoadKeyMappings() {
    ; Try to read key mappings from file
    if !FileExist(KeyMappingsFile)
        return {"1": "F1", "2": "F2", "3": "F3", "4": "F4", "5": "F5", "6": "F6", "7": "F7", "8": "F8", "9": "F9"}

    FileRead, KeyMappings, %KeyMappingsFile%
    ; Try to parse the key mappings as JSON
    try {
        return JSON.parse(KeyMappings)
    } catch {
        MsgBox, 16, Error, Invalid key mappings in file. Using default key mappings.
        return {"1": "F1", "2": "F2", "3": "F3", "4": "F4", "5": "F5", "6": "F6", "7": "F7", "8": "F8", "9": "F9"}
    }
}

UpdateKeyMappings() {
    ; Initialize an empty string to store the key mappings
    mappings := ""

    ; Iterate through the KeyMappings object
    for fkey, numkey in KeyMappings {
        ; Check if the current F key hotkey matches the F key value in KeyMappings
        if (A_ThisHotkey = fkey) {
            ; If it matches, add the corresponding number row key and F key to the mappings string
            mappings .= numkey . " = " . fkey . "`n"
            break  ; Exit the loop once a match is found
        }
    }

    ; Check if the GUI control exists before updating it
    if WinExist("ahk_class AutoHotkeyGUI")
        GuiControl, Text, myControl, %mappings%
}

LoadKeyMappings()

$CapsLock::
    Toggle := !Toggle
    If (Toggle) {
        ; Map number row keys to corresponding F keys
        for key, value in KeyMappings {
            Hotkey, %key%, %value%, On
        }

        ; Create a semi-transparent GUI window with a label to display the new keymaps
        Gui +LastFound +AlwaysOnTop +ToolWindow
        Gui Color, FFFFFF
        Gui Add, Text, x5 y5 w300 h150 +Wrap, myControl
        Gui Add, Button, x5 y160 w100 h30, Settings
        Gui Show, x5 y5 NoActivate
        WinSet, Transparent, 200

        ; Update the GUI window with the current key mappings
        UpdateKeyMappings()
    } Else {
        ; Disable number row hotkeys when toggled off
        for key, value in KeyMappings {
            Hotkey, %key%, %value%, Off
        }

        ; Hide the GUI window when toggled off
        Gui Hide
    }

