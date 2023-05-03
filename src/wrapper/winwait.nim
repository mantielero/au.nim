import constants

{.push  cdecl, discardable, dynlib: dllname.}

proc auWinWait_proto(szTitle: WideCString; szText: WideCString; nTimeout: int = 0): int {.importc: "AU3_WinWait"}

proc auWinWaitByHandle*(hWnd: int; nTimeout: int = 0): int {.importc: "AU3_WinWaitByHandle"}
proc auWinWaitActive_proto(szTitle: WideCString; szText: WideCString; nTimeout: int = 0): int {. importc: "AU3_WinWaitActive"}

proc auWinWaitActiveByHandle*(hWnd: int; nTimeout: int): int {.importc: "AU3_WinWaitActiveByHandle"}
proc auWinWaitClose_proto(szTitle: WideCString; szText: WideCString; nTimeout: int = 0): int {. importc: "AU3_WinWaitClose"}

proc auWinWaitCloseByHandle*(hWnd: int; nTimeout: int): int {.importc: "AU3_WinWaitCloseByHandle"}
proc auWinWaitNotActive_proto(szTitle: WideCString; szText: WideCString; nTimeout: int): int {. importc: "AU3_WinWaitNotActive"}

proc auWinWaitNotActiveByHandle*(hWnd: int; nTimeout: int = 0): int {.importc: "AU3_WinWaitNotActiveByHandle"}

{.pop.}

{.push discardable.}
proc winWait*(szTitle: string; szText= ""; nTimeout: int = 0): int = 
    ## https://www.autoitscript.com/autoit3/docs/functions/WinWait.htm
    ## Pauses execution of the script until the requested window exists.
    result = auWinWait_proto(szTitle.newWideCString, szText.newWideCString, nTimeout)
    if result == 0:
        raise newException(ValueError, "waiting for window failed")

proc winWaitActive*(szTitle: string; szText = ""; nTimeout: int = 0): int =   #FIX: I am not sure this is returning a handle
    ## https://www.autoitscript.com/autoit3/docs/functions/WinWaitActive.htm
    ## Pauses execution of the script until the requested window is active.
    result = auWinWaitActive_proto(szTitle.newWideCString, szText.newWideCString, nTimeout)
    if result == 0:
        raise newException(ValueError, "waiting for active window failed")


proc auWinWaitClose*(szTitle: string; szText = ""; nTimeout: int = 0): int = 
    auWinWaitClose_proto(szTitle.newWideCString, szText.newWideCString, nTimeout)

proc auWinWaitNotActive*(szTitle: string; szText = ""; nTimeout: int = 0): int = 
    auWinWaitNotActive_proto(szTitle.newWideCString, szText.newWideCString, nTimeout)
{.pop.}