import constants

{.push  cdecl, discardable, dynlib: dllname.}

proc auWinGetProcess_proto(szTitle: WideCString; szText: WideCString): int32 {.importc: "AU3_WinGetProcess"}

proc auWinGetProcessByHandle*(hWnd: int): int32 {.importc: "AU3_WinGetProcessByHandle"}

{.pop.}


proc auWinGetProcess*(szTitle: string; szText = ""): int32 {.inline discardable.} = 
    auWinGetProcess_proto(szTitle.newWideCString, szText.newWideCString) 