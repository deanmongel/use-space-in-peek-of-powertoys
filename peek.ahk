;https://www.autohotkey.com/boards/viewtopic.php?t=23987
GetFocusedControlClassNN( ) 
{
GuiWindowHwnd := WinExist("A")		;stores the current Active Window Hwnd id number in "GuiWindowHwnd" variable
				;"A" for Active Window

FocusedControl := ControlGetClassNN(ControlGetFocus("ahk_id " GuiWindowHwnd))	;stores the  classname "ClassNN" of the current focused control from the window above in "FocusedControl" variable
						;"ahk_id" searches windows by Hwnd Id number

return FocusedControl
}

;only active in explorer
#HotIf WinActive("ahk_exe explorer.exe", )
space::
{
    classnn:=GetFocusedControlClassNN()
    ;not active in searching or renaming files
    if (!RegExMatch(classnn,"Microsoft.UI.Content.DesktopChildSiteBridge.*") and !RegExMatch(classnn,"Edit.*") )
    {
        Send("!{space}")
    }
    else
    {
        Send("{space}")
    }
    return
}
#HotIf

;press space again to closee peek ui
#HotIf WinActive("ahk_exe PowerToys.Peek.UI.exe", )
space::^w
#HotIf
