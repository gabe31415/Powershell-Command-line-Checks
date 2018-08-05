# AUTHOR: github username: gabe31415
# Get HW info

function GetHwModel
{
    $wmiHW = Get-WmiObject Win32_ComputerSystem
    return $wmiHW.Model
}
