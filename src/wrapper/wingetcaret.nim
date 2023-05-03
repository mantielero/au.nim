import constants

{.push  cdecl, discardable, dynlib: dllname.}


proc auWinGetCaretPos_proto(lpPoint: pointer): int {.importc: "AU3_WinGetCaretPos"}
{.pop.}
proc auWinGetCaretPos(): Point {.inline discardable.} = 
    var point: Point
    auWinGetCaretPos_proto(point.addr)
    return point