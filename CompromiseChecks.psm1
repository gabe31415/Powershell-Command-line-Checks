# AUTHOR: github username: gabe31415
# Do system compromise checks

function DoCompromiseChecks
{
    $OsFriendly = GetOsNameFriendly
    if (($OsFriendly -like "*2012*") -or ($OsFriendly -like "*2016*"))
    {$OSflavor = "2012-2016"}
    elseif ($OsFriendly -like "*2003*")
            {$OSflavor = "2003"}
    else
    {
    # Clear-Host
    Write-Host "*****************************************"
    Write-Host "*****************************************"
    Write-Host ""
    Write-Host ""
    write-host "This OS: " $OsFriendly " is not yet accounted for in these checks"
    Write-Host ""
    Write-Host ""
    Write-Host "*****************************************"
    Write-Host "*****************************************"
    return
    }
}