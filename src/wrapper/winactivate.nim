import constants

{.push  cdecl, discardable, dynlib: dllname.}



proc auWinActivate_proto(szTitle: WideCString; szText: WideCString): int {.importc: "AU3_WinActivate"}

proc auWinActivateByHandle*(hWnd: int): int {.importc: "AU3_WinActivateByHandle"}

{.pop.}

proc auWinActivate*(szTitle: string; szText = ""): int {.inline discardable.} = 
    auWinActivate_proto(szTitle.newWideCString, szText.newWideCString) 