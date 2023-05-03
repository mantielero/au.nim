import constants

{.push  cdecl, discardable, dynlib: dllname.}


proc auWinActive_proto(szTitle: WideCString; szText: WideCString): int {.importc: "AU3_WinActive"}

proc auWinActiveByHandle*(hWnd: int): int {.importc: "AU3_WinActiveByHandle"}

{.pop.}

proc auWinActive*(szTitle: string; szText = ""): int {.inline discardable.} = 
    auWinActive_proto(szTitle.newWideCString, szText.newWideCString) 