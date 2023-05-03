import constants

{.push  cdecl, discardable, dynlib: dllname.}

proc auWinGetClassList_proto(szTitle: WideCString; szText: WideCString; szRetText: pointer; nBufSize: int) {.importc: "AU3_WinGetClassList"}

proc auWinGetClassListByHandle_proto(hWnd: int; szRetText: pointer; nBufSize: int) {. importc: "AU3_WinGetClassListByHandle"}
{.pop.}

proc auWinGetClassList*(szTitle: string; szText = ""): string {.inline discardable.} = 
    var buffer: array[MAX_BUF, Utf16Char]
    auWinGetClassList_proto(szTitle.newWideCString, szText.newWideCString, buffer[0].addr, buffer.len)
    return $(cast[WideCString](buffer[0].addr))

proc auWinGetClassListByHandle*(hWnd: int): string {.inline discardable.} = 
    var buffer: array[MAX_BUF, Utf16Char]
    auWinGetClassListByHandle_proto(hWnd, buffer[0].addr, buffer.len)
    return $(cast[WideCString](buffer[0].addr))
