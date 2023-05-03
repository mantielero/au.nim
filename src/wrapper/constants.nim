
const dllname* = when sizeof(int) == 8: 
                   "AutoItX3_x64.dll" 
                 else: 
                   "AutoItX3.dll"
const
    auINTDEFAULT*  = (- 2147483647) # "Default" value for _some_ int parameters (largest negative number)
    SW_SHOWNORMAL* = 1
    MAX_BUF*        = 65536

type
    Rect* {.final, pure.} = object
        x*, y*, width*, height*: int32

    Point* {.final, pure.} = object
        x*, y*: int32