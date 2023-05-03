import constants

{.push  cdecl, discardable, dynlib: dllname.}

proc auWinGetClientSize_proto(szTitle: WideCString; szText: WideCString; lpRect: pointer): int {. importc: "AU3_WinGetClientSize"}

proc auWinGetClientSizeByHandle_proto(hWnd: int; lpRect: pointer): int {.importc: "AU3_WinGetClientSizeByHandle"}


{.pop.}

proc auWinGetClientSize*(szTitle: string; szText = ""): Rect {.inline discardable.} = 
    var rect: Rect
    auWinGetClientSize_proto(szTitle.newWideCString, szText.newWideCString, rect.addr)
    return rect

proc auWinGetClientSizeByHandle*(hWnd: int): Rect {.inline discardable.} = 
    var rect: Rect
    auWinGetClientSizeByHandle_proto(hWnd, rect.addr)
    return rect