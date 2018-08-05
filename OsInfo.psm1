# AUTHOR: github username: gabe31415
# Get OS

function GetOsNameFriendly
{
    $wmiOS = (Get-WmiObject -Class Win32_OperatingSystem).caption
    return $wmiOS
}