import constants

{.push  cdecl, discardable, dynlib: dllname.}


proc auMouseClick_proto(szButton: WideCString; nX: int = auINTDEFAULT; nY: int = auINTDEFAULT; nClicks: int = 1; nSpeed: int = - 1): int {. importc: "AU3_MouseClick"}

proc auMouseClickDrag_proto(szButton: WideCString; nX1: int; nY1: int; nX2: int; nY2: int; nSpeed: int = - 1): int {.importc: "AU3_MouseClickDrag"}

proc auMouseDown_proto(szButton: WideCString) {.importc: "AU3_MouseDown"}

proc auMouseGetCursor*(): int {.importc: "AU3_MouseGetCursor"}
proc auMouseGetPos_proto(lpPoint: pointer) {.importc: "AU3_MouseGetPos"}

proc auMouseMove*(nX: int; nY: int; nSpeed: int = - 1): int {.importc: "AU3_MouseMove"}
proc auMouseUp_proto(szButton: WideCString) {.importc: "AU3_MouseUp"}

proc auMouseWheel_proto(szDirection: WideCString; nClicks: int) {.importc: "AU3_MouseWheel"}


{.pop.}

proc auMouseClick*(szButton: string; nX: int = auINTDEFAULT; nY: int = auINTDEFAULT; nClicks: int = 1; nSpeed: int = - 1): int {.inline discardable.} = 
    auMouseClick_proto(szButton.newWideCString, nX, nY, nClicks, nSpeed)

proc auMouseClickDrag*(szButton: string; nX1: int; nY1: int; nX2: int; nY2: int; nSpeed: int = - 1): int {.inline discardable.} = 
    auMouseClickDrag_proto(szButton.newWideCString, nX1, nY1, nX2, nY2, nSpeed)

proc auMouseDown*(szButton: string) {.inline discardable.} = 
    auMouseDown_proto(szButton.newWideCString) 

proc auMouseGetPos*(): Point {.inline discardable.} = 
    var point: Point
    auMouseGetPos_proto(point.addr)
    return point

proc auMouseUp*(szButton: string) {.inline discardable.} = 
    auMouseUp_proto(szButton.newWideCString) 

proc auMouseWheel*(szDirection: string; nClicks: int) {.inline discardable.} = 
    auMouseWheel_proto(szDirection.newWideCString, nClicks)
    