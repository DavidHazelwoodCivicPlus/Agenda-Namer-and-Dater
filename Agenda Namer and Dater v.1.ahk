Gui, Add, Button, x222 y329 w100 h30 gshow, Display code
Gui, Add, Button, x352 y329 w100 h30 gsave, Run Code
Gui, Add, Edit, x22 y59 w200 h40 , PUT NAME OF DEPARTMENT HERE Regular Meeting Agenda (PDF)
Gui, Add, Text, x28 y19 w122 h30 , Write out what you want each description field to be populated with
Gui, Add, Radio, x22 y119 w110 h30, mm-dd-yyyy
Gui, Add, Radio, x22 y159 w110 h30, m-d-yy
Gui, Add, Radio, x22 y199 w110 h30, mmddyy
Gui, Add, Radio, x22 y239 w110 h30, mdyy
Gui, Add, Text, x132 y119 w100 h30 , Example: 08-02-1996
Gui, Add, Text, x132 y159 w100 h30 , Example: 8-2-96
Gui, Add, Text, x132 y199 w100 h30 , Example: 08021996
Gui, Add, Text, x132 y239 w100 h30 , Example: 8296
Gui, Add, DropDownList, x282 y69 w140 h100 , ||Simple|Special
Gui, Show, x127 y87 h379 w479, Auto Simple Agenda Name and Date Program
Return

show:
IniRead, iniinfo, %myinipath%, myinfo, info1
GuiControl,, iniinfo, %iniinfo%
Return

save:
gui, submit

GuiControlGet, department, , Edit1

Clipboard := "let file = document.getElementsByClassName('spanFileName fileType pdf');"
           . "`nlet elements = document.getElementsByClassName('description');"  
           . "`nlet date = document.getElementsByClassName('agendaDate');" 
           . "`nfor (var i = 0; i < date.length; i++) {" 
           . "`ndate[i].value = file[i].innerText.replace("".pdf"", """").slice(0, 2) + '/' + file[i].innerText.slice(3, 5) + '/' + file[i].innerText.slice(6).replace("".pdf"", """");" 
           . "`nelements[i].innerText = '" department "';" 
           . "`n}"

MsgBox, % Clipboard
GuiClose:
Gui, destroy
Return

; Made by David Hazelwood
; for CivicPlus
; Version .1
; October 10th, 2023