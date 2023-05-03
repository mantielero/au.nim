import constants

{.push  cdecl, discardable, dynlib: dllname.}


proc auAutoItSetOption_proto(szOption: WideCString; nValue: int): int {.importc: "AU3_AutoItSetOption"}
{.pop.}

proc auAutoItSetOption*(szOption: string; nValue: int): int {.inline discardable.} = 
    auAutoItSetOption_proto(szOption.newWideCString, nValue)