import constants

{.push  cdecl, discardable, dynlib: dllname.}
proc auerror*(): int {.importc: "AU3_error"}
{.pop.}