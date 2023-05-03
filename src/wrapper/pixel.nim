import constants

{.push  cdecl, discardable, dynlib: dllname.}


proc auPixelChecksum_proto(lpRect: Rect; nStep: int = 1): uint32 {.importc: "AU3_PixelChecksum"}

proc auPixelGetColor*(nX: int; nY: int): int {.importc: "AU3_PixelGetColor"}
proc auPixelSearch*(lpRect: Rect; nCol: int; nVar: int; nStep: int; pPointResult: Point) {.importc: "AU3_PixelSearch"}
# proc auPixelSearch_proto(lpRect: Rect; nCol: int; nVar: int; nStep: int; pPointResult: pointer) {.importc: "AU3_PixelSearch"}
# proc auPixelSearch*(left, top, right, bottom: int32; nCol: int; nVar: int = 0; nStep: int = 1): Point {.inline discardable.} =
#     var area = Rect(x: left, y: top, width: right, height: bottom)
#     var point: Point
#     auPixelSearch_proto area, nCol, nVar, nStep, point.addr
#     return point
{.pop.}

proc auPixelChecksum*(left, top, right, bottom: int32, nStep: int = 1): uint32 {.inline discardable.}  =
    auPixelChecksum_proto Rect(x: left, y: top, width: right, height: bottom), nStep