-- ? ?? ??
set appName to "GPT-4"

-- ?? ??? ??? ??
activate application appName
repeat until exists window 1 of application appName    
    delay 0.5
end repeat

tell application "System Events"
    tell application appName to activate    
    
    -- ? ID ??
    set frontApp to first application process whose frontmost is true
    set frontAppID to name of frontApp
end tell

tell application frontAppID
    tell application appName to activate
    set appTitle to name of front window

    -- appTitle? "GPT-4"? ?? ??? ?? (??? ???? ???)
    repeat until appTitle is not "GPT-4"
        delay 0.3
        set appTitle to name of front window
    end repeat
end tell

tell application "System Events"
    tell application process appName
        set frontmost to true         
        delay 0.2
		keystroke "v" using command down    -- ???? ??
		delay 0.2
        --key code 36     -- ?? ??
    end tell
end tell

