import constants

{.push  cdecl, discardable, dynlib: dllname.}
proc auClipGet_proto(szClip: pointer; nBufSize: int) {.importc: "AU3_ClipGet"}
       
proc auClipPut_proto(szClip: WideCString) {.importc: "AU3_ClipPut"}

{.pop.}

proc clipGet*(): string = #{.inline discardable.} = 
    ## Retrieves text from the clipboard.
    var buffer: array[MAX_BUF, Utf16Char]
    auClipGet_proto(buffer[0].addr, buffer.len)
    return $(cast[WideCString](buffer[0].addr))

proc clipPut*(szClip: string) = #{.inline discardable.} = 
    ## Writes text to the clipboard.
    auClipPut_proto(szClip.newWideCString) 
