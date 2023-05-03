import constants

{.push  cdecl, discardable, dynlib: dllname.}

proc auSleep*(nMilliseconds: int) {.importc: "AU3_Sleep"}

{.pop.}