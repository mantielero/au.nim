## ◈-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-◈
## | Most basic Notepad automation sample v0.1  |
## | Developed in 2021 by Victoria A. Guevara   |
## ◈-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-◈
import au
import std/[os]


proc openMenuFile() =
    send "!f" # File menu item

proc openMenuPageSetup() =
    send "!f!u" # File menu item

proc main() =
    init()
    let pid = run "notepad.exe"
    echo "Process PID: ", pid

    let handle = winWaitActive "[Class:Notepad]"
    echo "Window handle -I don't think this is a handle-: ", handle

    send "Hello, autoit & AutoNim !"

    let handle2 = winGetHandle("[Class:Notepad]")
    echo "Window handle: ", handle2

    #winMenuSelectItem("[CLASS:Notepad]", "", "&File") #, "Page Set&up...")   # Not working
    openMenuPageSetup()
    3000.sleep()
    winKill( handle2)

    echo au.isAdmin()

    # Show clipboard content
    clipPut("Esto es una prueba")
    echo clipGet()

main()