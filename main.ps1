# AUTHOR: github username: gabe31415
# dont forget to modify your powershell execution level
# for your current ADMINISTRATOR powershell session run:
# 'Set-ExecutionPolicy Bypass -Scope Process'

# if PS ver4, or greater, stop running if not "run as administrator"
#Requires -RunAsAdministrator

# if PS version is LESS THAN version 4, this will make sure you are "run as administrator"
if ($PSVersionTable.PSVersion.Major -lt 4) {
    if (-Not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)){
        write-host "Exiting!!!!!"
        write-host "BECAUSE: You are running a version of powershell less than version 4 AND you aren't running powershell as an ADMINISTRATOR"
    }
    pause
    exit
}

# Import psm1 files in same folder as this script
# used '-Force' so that changes during each psm1 modification
#   will update in the current running powershell instance
Import-Module $PSScriptRoot\OsInfo.psm1 -Force
Import-Module $PSScriptRoot\HwInfo.psm1 -Force
Import-Module $PSScriptRoot\CompromiseChecks.psm1 -Force

function Show-Menu
{
    param (
        [string]$Title = 'My Menu'
    )
    Clear-Host
    Write-Host "==================== $Title ===================="
    Write-Host ""
    Write-Host "C: Press 'C' for COMPROMISED SYSTEM checks"
    Write-Host "Q: Press 'Q' to quit."
    Write-Host ""
}

do
    {
        Show-Menu -Title 'MAIN menu'
        $selection = Read-Host "Please make a selection"
        switch ($selection)
        {
            'c' { DoCompromiseChecks }
            'q' { return }
        }
        pause
    }
    until ($selection -eq 'q')