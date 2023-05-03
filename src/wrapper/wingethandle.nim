import constants

{.push  cdecl, discardable, dynlib: dllname.}

proc auWinGetHandle_proto(szTitle: WideCString; szText: WideCString): int {.importc: "AU3_WinGetHandle"}

proc auWinGetHandleAsText_proto(szTitle: WideCString; szText: WideCString; szRetText: pointer; nBufSize: int) {.importc: "AU3_WinGetHandleAsText"}

{.pop.}

{.push discardable.}
proc winGetHandle*(szTitle: string; szText = ""): int = 
    ## https://www.autoitscript.com/autoit3/docs/functions/WinGetHandle.htm
    ## Retrieves the internal handle of a window.
    result = auWinGetHandle_proto(szTitle.newWideCString, szText.newWideCString) 
    if result == 0:
        raise newException(ValueError, "unable to get a handle for the window")


proc auWinGetHandleAsText*(szTitle: string; szText = ""): string =
    var buffer: array[MAX_BUF, Utf16Char] 
    auWinGetHandleAsText_proto(szTitle.newWideCString, szText.newWideCString, buffer[0].addr, buffer.len)
    return $(cast[WideCString](buffer[0].addr))
{.pop.}