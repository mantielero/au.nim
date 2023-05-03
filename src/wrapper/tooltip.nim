import constants

{.push  cdecl, discardable, dynlib: dllname.}

proc auToolTip_proto(szTip: WideCString; nX: int = auINTDEFAULT; nY: int = auINTDEFAULT) {. importc: "AU3_ToolTip"}



{.pop.}

proc auToolTip*(szTip: string; nX: int = auINTDEFAULT; nY: int = auINTDEFAULT) {.inline discardable.} = 
    auToolTip_proto(szTip.newWideCString, nX, nY)