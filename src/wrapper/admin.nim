import constants

{.push  cdecl, discardable, dynlib: dllname.}
proc auIsAdmin(): int {.importc: "AU3_IsAdmin"}
 
{.pop.}

proc isAdmin*():bool =
  ## Checks if the current user has full administrator privileges.
  if auIsAdmin() == 0:
    return false
  return true

