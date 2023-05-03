import constants

{.push  cdecl, discardable, dynlib: dllname.}
proc auShutdown*(nFlags: int): int {.importc: "AU3_Shutdown"}
{.pop.}
