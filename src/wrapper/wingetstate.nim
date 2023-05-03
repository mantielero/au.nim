import constants

{.push  cdecl, discardable, dynlib: dllname.}

proc auWinGetState_proto(szTitle: WideCString; szText: WideCString): int {.importc: "AU3_WinGetState"}

proc auWinGetStateByHandle*(hWnd: int): int {.importc: "AU3_WinGetStateByHandle"}

{.pop.}



proc auWinGetState*(szTitle: string; szText = ""): int {.inline discardable.} = 
    auWinGetState_proto(szTitle.newWideCString, szText.newWideCString) 