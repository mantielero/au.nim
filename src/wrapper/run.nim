import constants

type
  ShowFlag = enum
    swHide = 0      # The app runs but you can only see it under Task Manager (@SW_HIDE)
    swNormal = 1    # The app opens normally
    swMinimize = 2  # The app opens minimized (@SW_MINIMIZE)
    swMaximize = 3  # The app opens maximized (@SW_MAXIMIZE)

{.push  cdecl, discardable, dynlib: dllname.}



proc auRun_proto(szProgram: WideCString; szDir: WideCString; nShowFlag: int = swNormal.int): int {. importc: "AU3_Run"}

proc auRunWait_proto(szProgram: WideCString; szDir: WideCString; nShowFlag: int = swNormal.int): int {. importc: "AU3_RunWait"}

proc auRunAs_proto(szUser: WideCString; szDomain: WideCString; szPassword: WideCString; 
                   nLogonFlag: int; szProgram: WideCString; szDir: WideCString; 
                   nShowFlag: int = swNormal.int): int {.importc: "AU3_RunAs"}

proc auRunAsWait_proto(szUser: WideCString; szDomain: WideCString; szPassword: WideCString; 
                       nLogonFlag: int; szProgram: WideCString; szDir: WideCString; 
                       nShowFlag: int = swNormal.int): int {.importc: "AU3_RunAsWait"}

{.pop.}

{.push discardable.}

proc run*(szProgram: string; szDir = ""; nShowFlag: ShowFlag = swNormal): int  = 
    ## Runs an external program. Returns the PID
    result = auRun_proto(szProgram.newWideCString, szDir.newWideCString, nShowFlag.int)
    if result == 0:
        raise newException(ValueError, "unable to run the program: " & szProgram)
    

proc auRunWait*(szProgram: string; szDir = ""; nShowFlag: ShowFlag = swNormal): int  = 
    auRunWait_proto(szProgram.newWideCString, szDir.newWideCString, nShowFlag.int)

proc auRunAs*(szUser: string; szDomain: string; szPassword: string; 
              nLogonFlag: int; szProgram: string; szDir: string; 
              nShowFlag: ShowFlag = swNormal): int = 
    auRunAs_proto(szUser.newWideCString, szDomain.newWideCString, szPassword.newWideCString, 
                  nLogonFlag, szProgram.newWideCString, szDir.newWideCString, nShowFlag.int)

proc auRunAsWait*(szUser: string; szDomain: string; szPassword: string; 
                  nLogonFlag: int; szProgram: string; szDir: string; 
                  nShowFlag: ShowFlag = swNormal): int {.inline discardable.} = 
    auRunAsWait_proto(szUser.newWideCString, szDomain.newWideCString, szPassword.newWideCString, 
                      nLogonFlag, szProgram.newWideCString, szDir.newWideCString, nShowFlag.int)
{.pop.}
