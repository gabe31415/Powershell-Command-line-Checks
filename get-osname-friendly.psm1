# AUTHOR: github username: gabe31415
# Get OS version info

function GetOsNameFriendly
{
    $wmiOS = Get-WmiObject -Class Win32_OperatingSystem
    return $wmiOS.caption
}
