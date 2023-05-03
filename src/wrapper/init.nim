import constants

{.push  cdecl, discardable, dynlib: dllname.}
proc init*() {.importc: "AU3_Init"}

{.pop.}