#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#MaxThreadsPerHotkey 255
#KeyHistory 0
#NoTrayIcon
DetectHiddenWindows, On
ListLines Off
Process, Priority, , A
SetBatchLines, 0
SetKeyDelay, 0, 0
SetMouseDelay, 0
SetDefaultMouseSpeed, 0
SetWinDelay, 0
SetWorkingDir %A_ScriptDir%
SendMode Input
#SingleInstance Force
SetWorkingDir %A_ScriptDir%
SetBatchLines -1

Gui Add, Edit, x74 y43 w120 h21 vcap, 8
Gui Add, Text, x43 y15 w179 h23 +0x200, CPS Cap (Reccommended 8 or less)
Gui Add, Button, x17 y259 w80 h23 vstart gstart default, START
Gui Add, Button, x175 y259 w80 h23 vstop gstop, STOP
Gui Add, Edit, x73 y145 w120 h21 vtime, 0.12
Gui Add, Text, x48 y99 w187 h23 +0x200, Seconds to wait before click registered 
Gui Add, Text, x48 y119 w170 h23 +0x200, as held down (Recommended 0.12)
Gui Add, Edit, x54 y206 w58 h21 voption, 2
Gui, Add, Text, x128 y210 w10 h21, in
Gui Add, Edit, x152 y206 w58 h21 vmax, 3
Gui Add, Text, x32 y173 w222 h23 +0x200, Double Click Interval (Recommended 2 in 3)
Gui Add, Button, x107 y259 w59 h23 ghelp, HELP
Guicontrol, disable, stop
Gui Show, w275 h293, Made by Sylestic#9539

toggled = 0

Return


$*LButton::

; script off mode
if (toggled == 0)
{
KeyWait, LButton, T%time%
If not ErrorLevel
{
click
}
else if ErrorLevel
{
	Send, {LButton down}
    KeyWait, LButton
    send, {LButton up}
}  
}
; script off mode



; script on mode
else if (toggled == 1)
{
KeyWait, LButton, T%time%
If not ErrorLevel
{

; cps counter
CPS := [] ; this tells ahk that CPS is a list
CPS.Push(A_TickCount)
fn := ObjBindMethod(CPS, "Pop") ; pop = inc cps and cps = the list of where clicks are stored ala click1 click2 click3
SetTimer % fn, -1000
; cps counter end


if ( CPS.Count() < cap)
{
random, chance, 1, max
if chance between 1 and %option%
{
msgbox, %chance%
click, 2
}
else
{
    click
    return
}
 
}


if ( CPS.Count() > cap)
    {
        click      
        return
    }
    }
    
    
    
else if ErrorLevel
{
	Send, {LButton down}
    KeyWait, LButton
    send, {LButton up}
            return
}
}
return
; script on mode end

; esc::exitapp

start:
{
gui, submit, nohide
toggled++
Guicontrol, disable, start
sleep, 100
Guicontrol, enable, stop
return
}

stop:
{
toggled--
Guicontrol, disable, stop
sleep, 100
Guicontrol, enable, start
return
}

help:
{
msgbox, 32, Press Enter to Continue, If you are not getting many double clicks`, try increasing the register value from 0.12 to 0.15 and so on., 10
msgbox, 32, Press Enter to Continue, Similarly`, if you have to hold the mouse button for too long in order for it to register as a hold`, try lowering it to 0.11., 12
msgbox, 32, Press Enter to Continue, These settings vary depending on mouse model and input lag., 7
msgbox, 32, Press Enter to Continue, The randomizer by default runs a random number from 1 to 3`, where if the number is 1 or 2`, you get a double click. And vice versa for single clicks., 14
msgbox, 32, Press Enter to Continue, You can adjust this to your preference. (Default is 66`% chance.), 10
msgbox, 32, Press Enter to Continue, The CPS cap depends on your RAW clicks (Physical clicks), 10
msgbox, 32, Press Enter to Continue, After reaching the cap`, your clicks are sent normally until you get under the cap again., 10
msgbox, 32, Press Enter to Continue, A cap of 8 will likely result at 12 to 15 cps., 10
msgbox, 48, REMINDER, Reminder: This program is designed for use with mice that do not double click. I am not responsible for any consequences caused by using the macro. Contact me for any queries @ Sylestic#9539 OR https://fiverr.com/RedstoneRadiant, 17
return
}

GuiClose:
    ExitApp
