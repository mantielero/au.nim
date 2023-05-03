import constants

{.push  cdecl, discardable, dynlib: dllname.}

proc auWinGetPos_proto(szTitle: WideCString; szText: WideCString; lpRect: pointer): int {.importc: "AU3_WinGetPos"}

proc auWinGetPosByHandle_proto(hWnd: int; lpRect: pointer): int {.importc: "AU3_WinGetPosByHandle"}


{.pop.}

proc auWinGetPos*(szTitle: string; szText = ""): Rect {.inline discardable.} = 
    var rect: Rect
    auWinGetPos_proto(szTitle.newWideCString, szText.newWideCString, rect.addr)
    rect.width -= rect.x; rect.height -= rect.y
    return rect

proc auWinGetPosByHandle*(hWnd: int): Rect {.inline discardable.} = 
    var rect: Rect
    auWinGetPosByHandle_proto(hWnd, rect.addr)
    rect.width -= rect.x; rect.height -= rect.y
    return rect