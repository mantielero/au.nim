import constants

{.push  cdecl, discardable, dynlib: dllname.}


proc auControlClick_proto(szTitle: WideCString; szText: WideCString; szControl: WideCString; szButton: WideCString; nNumClicks: int; nX: int = auINTDEFAULT; nY: int = auINTDEFAULT): int {. importc: "AU3_ControlClick"}
proc auControlClickByHandle_proto(hWnd: int; hCtrl: int; szButton: WideCString; nNumClicks: int; nX: int = auINTDEFAULT; nY: int = auINTDEFAULT): int {.importc: "AU3_ControlClickByHandle"}
proc auControlCommand_proto(szTitle: WideCString; szText: WideCString; szControl: WideCString; szCommand: WideCString; szExtra: WideCString; szResult: pointer; nBufSize: int) {.importc: "AU3_ControlCommand"}
proc auControlCommandByHandle_proto(hWnd: int; hCtrl: int; szCommand: WideCString; szExtra: WideCString; szResult: pointer; nBufSize: int) {. importc: "AU3_ControlCommandByHandle"}
proc auControlListView_proto(szTitle: WideCString; szText: WideCString; szControl: WideCString; szCommand: WideCString; szExtra1: WideCString; szExtra2: WideCString; szResult: pointer; nBufSize: int) {.importc: "AU3_ControlListView"}
proc auControlListViewByHandle_proto(hWnd: int; hCtrl: int; szCommand: WideCString; szExtra1: WideCString; szExtra2: WideCString; szResult: pointer; nBufSize: int) {.importc: "AU3_ControlListViewByHandle"}
proc auControlDisable_proto(szTitle: WideCString; szText: WideCString; szControl: WideCString): int {. importc: "AU3_ControlDisable"}
proc auControlDisableByHandle*(hWnd: int; hCtrl: int): int {.importc: "AU3_ControlDisableByHandle"}
proc auControlEnable_proto(szTitle: WideCString; szText: WideCString; szControl: WideCString): int {. importc: "AU3_ControlEnable"}
proc auControlEnableByHandle*(hWnd: int; hCtrl: int): int {.importc: "AU3_ControlEnableByHandle"}
proc auControlFocus_proto(szTitle: WideCString; szText: WideCString; szControl: WideCString): int {. importc: "AU3_ControlFocus"}

proc auControlFocusByHandle*(hWnd: int; hCtrl: int): int {.importc: "AU3_ControlFocusByHandle"}
proc auControlGetFocus_proto(szTitle: WideCString; szText: WideCString; szControlWithFocus: pointer; nBufSize: int) {.importc: "AU3_ControlGetFocus"}
proc auControlGetFocusByHandle_proto(hWnd: int; szControlWithFocus: pointer; nBufSize: int) {.importc: "AU3_ControlGetFocusByHandle"}
proc auControlGetHandle_proto(hWnd: int; szControl: WideCString): int {.importc: "AU3_ControlGetHandle"}
proc auControlGetHandleAsText_proto(szTitle: WideCString; szText: WideCString; szControl: WideCString; szRetText: pointer; nBufSize: int) {.importc: "AU3_ControlGetHandleAsText"}
proc auControlGetPos_proto(szTitle: WideCString; szText: WideCString; szControl: WideCString; lpRect: pointer): int {.importc: "AU3_ControlGetPos"}
proc auControlGetPosByHandle_proto(hWnd: int; hCtrl: int; lpRect: pointer): int {.importc: "AU3_ControlGetPosByHandle"}

proc auControlGetText_proto(szTitle: WideCString; szText: WideCString; szControl: WideCString; szControlText: pointer; nBufSize: int): int {.importc: "AU3_ControlGetText"}

proc auControlGetTextByHandle_proto(hWnd: int; hCtrl: int; szControlText: pointer; nBufSize: int) {.importc: "AU3_ControlGetTextByHandle"}

proc auControlHide_proto(szTitle: WideCString; szText: WideCString; szControl: WideCString): int {. importc: "AU3_ControlHide"}

proc auControlHideByHandle*(hWnd: int; hCtrl: int): int {.importc: "AU3_ControlHideByHandle"}
proc auControlMove_proto(szTitle: WideCString; szText: WideCString; szControl: WideCString; nX: int; nY: int; nWidth: int = - 1; nHeight: int = - 1): int {.importc: "AU3_ControlMove"}
proc auControlMoveByHandle*(hWnd: int; hCtrl: int; nX: int; nY: int; nWidth: int = - 1; nHeight: int = - 1): int {.importc: "AU3_ControlMoveByHandle"}
proc auControlSend_proto(szTitle: WideCString; szText: WideCString; szControl: WideCString; szSendText: WideCString; nMode: int = 0): int {.importc: "AU3_ControlSend"}
proc auControlSendByHandle_proto(hWnd: int; hCtrl: int; szSendText: WideCString; nMode: int = 0): int {.importc: "AU3_ControlSendByHandle"}
proc auControlSetText_proto(szTitle: WideCString; szText: WideCString; szControl: WideCString; szControlText: WideCString): int {.importc: "AU3_ControlSetText"}
proc auControlSetTextByHandle_proto(hWnd: int; hCtrl: int; szControlText: WideCString): int {. importc: "AU3_ControlSetTextByHandle"}
proc auControlShow_proto(szTitle: WideCString; szText: WideCString; szControl: WideCString): int {. importc: "AU3_ControlShow"}
proc auControlShowByHandle*(hWnd: int; hCtrl: int): int {.importc: "AU3_ControlShowByHandle"}
proc auControlTreeView_proto(szTitle: WideCString; szText: WideCString; szControl: WideCString; szCommand: WideCString; szExtra1: WideCString; szExtra2: WideCString; szResult: WideCString; nBufSize: int) {.importc: "AU3_ControlTreeView"}
proc auControlTreeViewByHandle_proto(hWnd: int; hCtrl: int; szCommand: WideCString; szExtra1: WideCString; szExtra2: WideCString; szResult: WideCString; nBufSize: int) {.importc: "AU3_ControlTreeViewByHandle"}


{.pop.}

proc auControlClick*(szTitle: string; szText: string; szControl: string; szButton: string; nNumClicks: int; nX: int = auINTDEFAULT; nY: int = auINTDEFAULT): int {.inline discardable.} = 
    auControlClick_proto(szTitle.newWideCString, szText.newWideCString, szControl.newWideCString, szButton.newWideCString, nNumClicks, nX, nY)


proc auControlClickByHandle*(hWnd: int; hCtrl: int; szButton: string; nNumClicks: int; nX: int = auINTDEFAULT; nY: int = auINTDEFAULT): int {.inline discardable.} = 
    auControlClickByHandle_proto(hWnd, hCtrl, szButton.newWideCString, nNumClicks, nX, nY)



proc auControlCommand*(szTitle: string; szText: string; szControl: string; szCommand: string; szExtra = ""): string {.inline discardable.} = 
    var buffer: array[MAX_BUF, Utf16Char]
    auControlCommand_proto(szTitle.newWideCString, szText.newWideCString, szControl.newWideCString, szCommand.newWideCString, szExtra.newWideCString, buffer[0].addr, buffer.len)
    return $(cast[WideCString](buffer[0].addr))

proc auControlCommandByHandle*(hWnd: int; hCtrl: int; szCommand: string; szExtra = ""): string {.inline discardable.} = 
    var buffer: array[MAX_BUF, Utf16Char]
    auControlCommandByHandle_proto(hWnd, hCtrl, szCommand.newWideCString, szExtra.newWideCString, buffer[0].addr, buffer.len)
    return $(cast[WideCString](buffer[0].addr))



proc auControlListView*(szTitle: string; szText: string; szControl: string; szCommand: string; szExtra1: string; szExtra2: string): string {.inline discardable.} = 
    var buffer: array[MAX_BUF, Utf16Char]
    auControlListView_proto(szTitle.newWideCString, szText.newWideCString, szControl.newWideCString, szCommand.newWideCString, szExtra1.newWideCString, szExtra2.newWideCString, buffer[0].addr, buffer.len)
    return $(cast[WideCString](buffer[0].addr))


proc auControlListViewByHandle*(hWnd: int; hCtrl: int; szCommand: string; szExtra1: string; szExtra2: string): string {.inline discardable.} = 
    var buffer: array[MAX_BUF, Utf16Char]
    auControlListViewByHandle_proto(hWnd, hCtrl, szCommand.newWideCString, szExtra1.newWideCString, szExtra2.newWideCString, buffer[0].addr, buffer.len)
    return $(cast[WideCString](buffer[0].addr))

proc auControlDisable*(szTitle: string; szText: string; szControl: string): int {.inline discardable.} = 
    auControlDisable_proto(szTitle.newWideCString, szText.newWideCString, szControl.newWideCString) 

proc auControlEnable*(szTitle: string; szText: string; szControl: string): int {.inline discardable.} = 
    auControlEnable_proto(szTitle.newWideCString, szText.newWideCString, szControl.newWideCString) 

proc auControlFocus*(szTitle: string; szText: string; szControl: string): int {.inline discardable.} = 
    auControlFocus_proto(szTitle.newWideCString, szText.newWideCString, szControl.newWideCString) 

proc auControlGetFocus*(szTitle: string; szText = ""): string {.inline discardable.} = 
    var buffer: array[MAX_BUF, Utf16Char]
    auControlGetFocus_proto(szTitle.newWideCString, szText.newWideCString, buffer[0].addr, buffer.len)
    return $(cast[WideCString](buffer[0].addr))

proc auControlGetPos*(szTitle: string; szText: string; szControl: string): Rect {.inline discardable.} = 
    var rect: Rect
    auControlGetPos_proto(szTitle.newWideCString, szText.newWideCString, szControl.newWideCString, rect.addr)
    rect.width -= rect.x; rect.height -= rect.y
    return rect

proc auControlGetFocusByHandle*(hWnd: int): string {.inline discardable.} = 
    var buffer: array[MAX_BUF, Utf16Char]
    auControlGetFocusByHandle_proto(hWnd, buffer[0].addr, buffer.len)
    return $(cast[WideCString](buffer[0].addr))

proc auControlGetHandle*(hWnd: int; szControl: string): int {.inline discardable.} = 
    auControlGetHandle_proto(hWnd, szControl.newWideCString) 

proc auControlGetHandleAsText*(szTitle: string; szText: string; szControl: string): string {.inline discardable.} = 
    var buffer: array[MAX_BUF, Utf16Char]
    auControlGetHandleAsText_proto(szTitle.newWideCString, szText.newWideCString, szControl.newWideCString, buffer[0].addr, buffer.len)
    return $(cast[WideCString](buffer[0].addr))

proc auControlGetPosByHandle*(hWnd: int; hCtrl: int): Rect {.inline discardable.} = 
    var rect: Rect
    auControlGetPosByHandle_proto(hWnd, hCtrl, rect.addr)
    rect.width -= rect.x; rect.height -= rect.y
    return rect

proc auControlGetText*(szTitle: string; szText: string; szControl: string): string {.inline discardable.} = 
    var buffer: array[MAX_BUF, Utf16Char]
    auControlGetText_proto(szTitle.newWideCString, szText.newWideCString, szControl.newWideCString, buffer[0].addr, buffer.len)
    return $(cast[WideCString](buffer[0].addr))

proc auControlGetTextByHandle*(hWnd: int; hCtrl: int): string {.inline discardable.} = 
    var buffer: array[MAX_BUF, Utf16Char]
    auControlGetTextByHandle_proto(hWnd, hCtrl, buffer[0].addr, buffer.len)
    return $(cast[WideCString](buffer[0].addr))

proc auControlHide*(szTitle: string; szText: string; szControl: string): int {.inline discardable.} = 
    auControlHide_proto(szTitle.newWideCString, szText.newWideCString, szControl.newWideCString) 

proc auControlMove*(szTitle: string; szText: string; szControl: string; nX: int; nY: int; nWidth: int = - 1; nHeight: int = - 1): int {.inline discardable.} = 
    auControlMove_proto(szTitle.newWideCString, szText.newWideCString, szControl.newWideCString, nX, nY, nWidth, nHeight)

proc auControlSend*(szTitle: string; szText: string; szControl: string; szSendText: string; nMode: int = 0): int {.inline discardable.} = 
    auControlSend_proto(szTitle.newWideCString, szText.newWideCString, szControl.newWideCString, szSendText.newWideCString, nMode)

proc auControlSendByHandle*(hWnd: int; hCtrl: int; szSendText: string; nMode: int = 0): int {.inline discardable.} = 
    auControlSendByHandle_proto(hWnd, hCtrl, szSendText.newWideCString, nMode)

proc auControlSetText*(szTitle: string; szText: string; szControl: string; szControlText: string): int {.inline discardable.} = 
    auControlSetText_proto(szTitle.newWideCString, szText.newWideCString, szControl.newWideCString, szControlText.newWideCString) 


proc auControlSetTextByHandle*(hWnd: int; hCtrl: int; szControlText: string): int {.inline discardable.} = 
    auControlSetTextByHandle_proto(hWnd, hCtrl, szControlText.newWideCString) 

proc auControlShow*(szTitle: string; szText: string; szControl: string): int {.inline discardable.} = 
    auControlShow_proto(szTitle.newWideCString, szText.newWideCString, szControl.newWideCString) 

proc auControlTreeView*(szTitle: string; szText: string; szControl: string; szCommand: string; szExtra1: string; szExtra2: string; szResult: string; nBufSize: int) {.inline discardable.} = 
    auControlTreeView_proto(szTitle.newWideCString, szText.newWideCString, szControl.newWideCString, szCommand.newWideCString, szExtra1.newWideCString, szExtra2.newWideCString, szResult.newWideCString, nBufSize)



proc auControlTreeViewByHandle*(hWnd: int; hCtrl: int; szCommand: string; szExtra1: string; szExtra2: string; szResult: string; nBufSize: int) {.inline discardable.} = 
    auControlTreeViewByHandle_proto(hWnd, hCtrl, szCommand.newWideCString, szExtra1.newWideCString, szExtra2.newWideCString, szResult.newWideCString, nBufSize)

