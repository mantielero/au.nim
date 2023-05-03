import constants

{.push  cdecl, discardable, dynlib: dllname.}


proc auWinExists_proto(szTitle: WideCString; szText: WideCString): int {.importc: "AU3_WinExists"}

proc auWinExistsByHandle*(hWnd: int): int {.importc: "AU3_WinExistsByHandle"}

{.pop.}

proc auWinExists*(szTitle: string; szText = ""): int {.inline discardable.} = 
    auWinExists_proto(szTitle.newWideCString, szText.newWideCString) 