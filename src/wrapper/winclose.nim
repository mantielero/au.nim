import constants

{.push  cdecl, discardable, dynlib: dllname.}

proc auWinClose_proto(szTitle: WideCString; szText: WideCString): int {.importc: "AU3_WinClose"}

proc auWinCloseByHandle*(hWnd: int): int {.importc: "AU3_WinCloseByHandle"}

{.pop.}

proc auWinClose*(szTitle: string; szText = ""): int {.inline discardable.} = 
    auWinClose_proto(szTitle.newWideCString, szText.newWideCString) 