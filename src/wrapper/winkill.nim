import constants

{.push  cdecl, discardable, dynlib: dllname.}


proc auWinKill_proto(szTitle: WideCString; szText: WideCString): int {.importc: "AU3_WinKill"}

proc auWinKillByHandle(hWnd: int): int {.importc: "AU3_WinKillByHandle"}


{.pop.}

{.push discardable.}
proc winKill*(szTitle: string; szText = ""): int = 
    ## https://www.autoitscript.com/autoit3/docs/functions/WinKill.htm
    ## Forces a window to close.
    auWinKill_proto(szTitle.newWideCString, szText.newWideCString) 

proc winKill*(hWnd:int) = 
    ## Kills a window by handle
    var success = auWinKillByHandle(hWnd)
    if success == 0:
        raise newException(ValueError, "failed to kill window by handle")
{.pop.}