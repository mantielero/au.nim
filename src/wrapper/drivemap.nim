import constants

{.push  cdecl, discardable, dynlib: dllname.}


proc auDriveMapAdd_proto(szDevice: WideCString; szShare: WideCString; nFlags: int; szUser: WideCString; szPwd: WideCString; szResult: pointer; nBufSize: int) {. importc: "AU3_DriveMapAdd"}

proc auDriveMapDel_proto(szDevice: WideCString): int {.importc: "AU3_DriveMapDel"}

proc auDriveMapGet_proto(szDevice: WideCString; szMapping: pointer; nBufSize: int) {.importc: "AU3_DriveMapGet"}

{.pop.}


proc auDriveMapAdd*(szDevice: string; szShare: string; nFlags: int; szUser: string; szPwd: string): string {.inline discardable.} = 
    var buffer: array[MAX_BUF, Utf16Char]
    auDriveMapAdd_proto(szDevice.newWideCString, szShare.newWideCString, nFlags, szUser.newWideCString, szPwd.newWideCString, buffer[0].addr, buffer.len)
    return $(cast[WideCString](buffer[0].addr))

proc auDriveMapDel*(szDevice: string): int {.inline discardable.} = 
    auDriveMapDel_proto(szDevice.newWideCString) 

proc auDriveMapGet*(szDevice: string): string{.inline discardable.} = 
    var buffer: array[MAX_BUF, Utf16Char]
    auDriveMapGet_proto(szDevice.newWideCString, buffer[0].addr, buffer.len)
    return $(cast[WideCString](buffer[0].addr))