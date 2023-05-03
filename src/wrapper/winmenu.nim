import constants

{.push  cdecl, discardable, dynlib: dllname.}

proc auWinMenuSelectItem_proto(szTitle: WideCString; szText: WideCString; szItem1: WideCString; szItem2: WideCString; szItem3: WideCString; szItem4: WideCString; szItem5: WideCString; szItem6: WideCString; szItem7: WideCString; szItem8: WideCString): int {.importc: "AU3_WinMenuSelectItem"}
proc auWinMenuSelectItemByHandle_proto(hWnd: int; szItem1: WideCString; szItem2: WideCString; szItem3: WideCString; szItem4: WideCString; szItem5: WideCString; szItem6: WideCString; szItem7: WideCString; szItem8: WideCString): int {.importc: "AU3_WinMenuSelectItemByHandle"}

{.pop.}


{.push discardable.}
proc winMenuSelectItem*(szTitle: string; szText: string; szItem1: string; szItem2 = ""; 
                        szItem3 = ""; szItem4 = ""; szItem5 = ""; szItem6 = ""; 
                        szItem7 = ""; szItem8 = "") = 
    ##[
    https://www.autoitscript.com/autoit3/docs/functions/WinMenuSelectItem.htm
    
    Invokes a menu item of a window.

    You should note that underlined menu items actually contain a & character to 
    indicate the underlining. Thus, the menu item File would actually require the 
    text "&File", and Convert would require "Con&vert" You can access menu items 
    up to six levels deep; and the window can be inactive, minimized, and/or even hidden. 
    
    ]## 
    let success = auWinMenuSelectItem_proto(szTitle.newWideCString, szText.newWideCString, szItem1.newWideCString, szItem2.newWideCString, szItem3.newWideCString, szItem4.newWideCString, szItem5.newWideCString, szItem6.newWideCString, szItem7.newWideCString, szItem8.newWideCString) 
    if success == 0:
        raise newException(ValueError, "failed to select item from menu")

proc auWinMenuSelectItemByHandle*(hWnd: int; szItem1: string; szItem2: string; 
                                  szItem3: string; szItem4: string; szItem5: string; 
                                  szItem6: string; szItem7: string; 
                                  szItem8: string): int = 
    auWinMenuSelectItemByHandle_proto(hWnd, szItem1.newWideCString, szItem2.newWideCString, szItem3.newWideCString, szItem4.newWideCString, szItem5.newWideCString, szItem6.newWideCString, szItem7.newWideCString, szItem8.newWideCString) 

{.pop.}