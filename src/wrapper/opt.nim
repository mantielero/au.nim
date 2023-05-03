import constants

{.push  cdecl, discardable, dynlib: dllname.}


proc auOpt_proto(szOption: WideCString; nValue: int): int {.importc: "AU3_Opt"}


{.pop.}

proc auOpt*(szOption: string; nValue: int): int {.inline discardable.} = 
    auOpt_proto(szOption.newWideCString, nValue)