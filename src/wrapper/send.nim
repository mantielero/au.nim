
import constants


type
  SendFlag = enum
    default = 0  ## Text contains special characters like + and ! to indicate SHIFT and ALT key-presses (default).  # $SEND_DEFAULT (0)
    raw     = 1  ##  keys are sent raw. # $SEND_RAW (1)


{.push  cdecl, discardable, dynlib: dllname.}

proc auSend_proto(szSendText: WideCString; nMode: int = 0) {.importc: "AU3_Send"}
{.pop.}

proc send*(szSendText: string; nMode: SendFlag = default) {.inline discardable.} = 
    ##[ 
    https://www.autoitscript.com/autoit3/docs/functions/Send.htm
    Sends simulated keystrokes to the active window.
    
    See the Appendix for some tips on using Send(). AutoIt can send all ASCII and Extended ASCII characters (0-255). To send UNICODE characters you must use the "ASC" option and the code of the character you wish to send (see {ASC} at the bottom of the table below).

    The "Send()" command syntax is similar to that of ScriptIt and the Visual Basic "SendKeys" command. Characters are sent as written with the exception of the following characters:

    - '!': This tells AutoIt to send an ALT keystroke, therefore Send("This is text!a") would send the keys "This is text" and then press "ALT+a".

      > N.B. Some programs are very choosy about capital letters and ALT keys, i.e., "!A" is different from "!a". The first says ALT+SHIFT+A, the second is ALT+a. If in doubt, use lowercase!
    
    - '+': This tells AutoIt to send a SHIFT keystroke; therefore, Send("Hell+o") would send the text "HellO". Send("!+a") would send "ALT+SHIFT+a".

    - '^': This tells AutoIt to send a CONTROL keystroke; therefore, Send("^!a") would send "CTRL+ALT+a".
      > N.B. Some programs are very choosy about capital letters and CTRL keys, i.e., "^A" is different from "^a". The first says CTRL+SHIFT+A, the second is CTRL+a. If in doubt, use lowercase!

    - '#': The hash now sends a Windows keystroke; therefore, Send("#r") would send Win+r which launches the Run() dialog box.
    ]##
    auSend_proto(szSendText.newWideCString, nMode.int)
