import constants

{.push  cdecl, discardable, dynlib: dllname.}

proc auWinSetOnTop_proto(szTitle: WideCString; szText: WideCString; nFlag: int): int {.importc: "AU3_WinSetOnTop"}

proc auWinSetOnTopByHandle*(hWnd: int; nFlag: int): int {.importc: "AU3_WinSetOnTopByHandle"}
proc auWinSetState_proto(szTitle: WideCString; szText: WideCString; nFlags: int): int {.importc: "AU3_WinSetState"}

proc auWinSetStateByHandle*(hWnd: int; nFlags: int): int {.importc: "AU3_WinSetStateByHandle"}
proc auWinSetTitle_proto(szTitle: WideCString; szText: WideCString; szNewTitle: WideCString): int {. importc: "AU3_WinSetTitle"}

proc auWinSetTitleByHandle_proto(hWnd: int; szNewTitle: WideCString): int {.importc: "AU3_WinSetTitleByHandle"}

proc auWinSetTrans_proto(szTitle: WideCString; szText: WideCString; nTrans: int): int {.importc: "AU3_WinSetTrans"}

proc auWinSetTransByHandle*(hWnd: int; nTrans: int): int {.importc: "AU3_WinSetTransByHandle"}

{.pop.}

proc auWinSetOnTop*(szTitle: string; szText: string; nFlag: int): int {.inline discardable.} = 
    auWinSetOnTop_proto(szTitle.newWideCString, szText.newWideCString, nFlag)

proc auWinSetState*(szTitle: string; szText: string; nFlags: int): int {.inline discardable.} = 
    auWinSetState_proto(szTitle.newWideCString, szText.newWideCString, nFlags)

proc auWinSetTitle*(szTitle: string; szText: string; szNewTitle: string): int {.inline discardable.} = 
    auWinSetTitle_proto(szTitle.newWideCString, szText.newWideCString, szNewTitle.newWideCString) 

proc auWinSetTitleByHandle*(hWnd: int; szNewTitle: string): int {.inline discardable.} = 
    auWinSetTitleByHandle_proto(hWnd, szNewTitle.newWideCString) 

proc auWinSetTrans*(szTitle: string; szText: string; nTrans: int): int {.inline discardable.} = 
    auWinSetTrans_proto(szTitle.newWideCString, szText.newWideCString, nTrans)