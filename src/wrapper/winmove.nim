import constants

{.push  cdecl, discardable, dynlib: dllname.}


proc auWinMove_proto(szTitle: WideCString; szText: WideCString; nX: int; nY: int; nWidth: int = - 1; nHeight: int = - 1): int {.importc: "AU3_WinMove"}

proc auWinMoveByHandle*(hWnd: int; nX: int; nY: int; nWidth: int = - 1; nHeight: int = - 1): int {.importc: "AU3_WinMoveByHandle"}

{.pop.}

proc auWinMove*(szTitle: string; szText: string; nX: int; nY: int; nWidth: int = - 1; nHeight: int = - 1): int {.inline discardable.} = 
    auWinMove_proto(szTitle.newWideCString, szText.newWideCString, nX, nY, nWidth, nHeight)