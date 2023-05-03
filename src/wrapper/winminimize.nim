import constants

{.push  cdecl, discardable, dynlib: dllname.}

proc auWinMinimizeAll*() {.importc: "AU3_WinMinimizeAll"}
proc auWinMinimizeAllUndo*() {.importc: "AU3_WinMinimizeAllUndo"}
{.pop.}