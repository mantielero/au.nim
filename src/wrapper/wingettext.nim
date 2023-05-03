import constants

{.push  cdecl, discardable, dynlib: dllname.}


proc auWinGetText_proto(szTitle: WideCString; szText: WideCString; szRetText: pointer; nBufSize: int) {.importc: "AU3_WinGetText"}

proc auWinGetTextByHandle_proto(hWnd: int; szRetText: pointer; nBufSize: int) {.importc: "AU3_WinGetTextByHandle"}

{.pop.}

proc auWinGetText*(szTitle: string; szText = ""): string {.inline discardable.} = 
    var buffer: array[MAX_BUF, Utf16Char]
    auWinGetText_proto(szTitle.newWideCString, szText.newWideCString, buffer[0].addr, buffer.len)
    return $(cast[WideCString](buffer[0].addr)) 

proc auWinGetTextByHandle*(hWnd: int): string {.inline discardable.} = 
    var buffer: array[MAX_BUF, Utf16Char]
    auWinGetTextByHandle_proto(hWnd, buffer[0].addr, buffer.len)
    return $(cast[WideCString](buffer[0].addr)) 
