import constants

{.push  cdecl, discardable, dynlib: dllname.}

proc auWinGetTitle_proto(szTitle: WideCString; szText: WideCString; szRetText: pointer; nBufSize: int) {.importc: "AU3_WinGetTitle"}
  
proc auWinGetTitleByHandle_proto(hWnd: int; szRetText: pointer; nBufSize: int) {.importc: "AU3_WinGetTitleByHandle"}


{.pop.}

proc auWinGetTitle*(szTitle: string; szText = ""): string {.inline discardable.} = 
    var buffer: array[MAX_BUF, Utf16Char]
    auWinGetTitle_proto(szTitle.newWideCString, szText.newWideCString, buffer[0].addr, buffer.len)
    return $(cast[WideCString](buffer[0].addr))  

proc auWinGetTitleByHandle*(hWnd: int): string {.inline discardable.} = 
    var buffer: array[MAX_BUF, Utf16Char]
    auWinGetTitleByHandle_proto(hWnd, buffer[0].addr, buffer.len)
    return $(cast[WideCString](buffer[0].addr))