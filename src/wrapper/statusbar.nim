import constants

{.push  cdecl, discardable, dynlib: dllname.}


proc auStatusbarGetText_proto(szTitle: WideCString; szText: WideCString; nPart: int; szStatusText: pointer; nBufSize: int): int {.importc: "AU3_StatusbarGetText"}

proc auStatusbarGetTextByHandle_proto(hWnd: int; nPart: int; szStatusText: pointer; nBufSize: int): int {.importc: "AU3_StatusbarGetTextByHandle"}

{.pop.}

proc auStatusbarGetText*(szTitle: string; szText = ""; nPart: int = 1): string {.inline discardable.} = 
    var buffer: array[MAX_BUF, Utf16Char]
    auStatusbarGetText_proto(szTitle.newWideCString, szText.newWideCString, nPart, buffer[0].addr, buffer.len)
    return $(cast[WideCString](buffer[0].addr))

proc auStatusbarGetTextByHandle*(hWnd: int; nPart: int = 1): string {.inline discardable.} = 
    var buffer: array[MAX_BUF, Utf16Char]
    auStatusbarGetTextByHandle_proto(hWnd, nPart, buffer[0].addr, buffer.len)
    return $(cast[WideCString](buffer[0].addr))