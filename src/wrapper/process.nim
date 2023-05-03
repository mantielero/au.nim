import constants

{.push  cdecl, discardable, dynlib: dllname.}

proc auProcessClose_proto(szProcess: WideCString): int {.importc: "AU3_ProcessClose"}

proc auProcessExists_proto(szProcess: WideCString): int {.importc: "AU3_ProcessExists"}

proc auProcessSetPriority_proto(szProcess: WideCString; nPriority: int): int {.importc: "AU3_ProcessSetPriority"}

proc auProcessWait_proto(szProcess: WideCString; nTimeout: int = 0): int {.importc: "AU3_ProcessWait"}

proc auProcessWaitClose_proto(szProcess: WideCString; nTimeout: int = 0): int {.importc: "AU3_ProcessWaitClose"}


{.pop.}

proc auProcessClose*(szProcess: string): int {.inline discardable.} = 
    auProcessClose_proto(szProcess.newWideCString) 

proc auProcessExists*(szProcess: string): int {.inline discardable.} = 
    auProcessExists_proto(szProcess.newWideCString) 

proc auProcessSetPriority*(szProcess: string; nPriority: int): int {.inline discardable.} = 
    auProcessSetPriority_proto(szProcess.newWideCString, nPriority)

proc auProcessWait*(szProcess: string; nTimeout: int = 0): int {.inline discardable.} = 
    auProcessWait_proto(szProcess.newWideCString, nTimeout)

proc auProcessWaitClose*(szProcess: string; nTimeout: int = 0): int {.inline discardable.} = 
    auProcessWaitClose_proto(szProcess.newWideCString, nTimeout)