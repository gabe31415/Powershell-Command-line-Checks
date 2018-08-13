# AUTHOR: github username: gabe31415
# Get OS

function Show-Menu
{
    param (
        [string]$Title = 'My Menu'
    )
    Clear-Host
    Write-Host "==================== $Title ===================="
    Write-Host ""
    Write-Host "0: Press '0' to get OS-Name (Friendly version)"
    Write-Host "1: Press '1' to get OS Licensing Status"
    Write-Host "Q: Press 'Q' to quit."
    Write-Host ""
}
function GetOsNameFriendly
{
    $wmiOS = (Get-WmiObject -Class Win32_OperatingSystem).caption
    return $wmiOS
}

function GetOsActivationStatus
{
    $wmiOSActivation = (Get-CimInstance -ClassName SoftwareLicensingProduct | where {$_.PartialProductKey -and ($_.name -match 'windows')}).LicenseStatus
        # codes from "license status" and there meaning
        # 0 = Unlicensed
        # 1 = Licensed
        # 2 = OOBGrace (Out-of-Box Grace)
        # 3 = OOTGrace (Out-of-Tolerance Grace)
        # 4 = NonGeniuneGrace
        # 5 = Notification
    If ($wmiOSActivation -ne 1)
    {
        return "fail"
    }
    else
    {
        return "pass"
    }
}


function DoOsChecks
{
    do
    {
        Show-Menu -Title 'Hardware check options'
        $selection = Read-Host "Please make a selection"
        switch ($selection)
        {
            '0' { GetOsNameFriendly }
            '1' { GetOsActivationStatus}
            'q' { return }
        }
        pause
    }
    until ($selection -eq 'q')
}