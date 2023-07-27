function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    $adminRole = [Security.Principal.WindowsBuiltInRole]::Administrator

    return $currentUser.IsInRole($adminRole)
}

function Run-ScriptAsAdmin {
    if (-NOT (Test-Admin)) {
        # Relaunch as administrator
        Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
        return $true
    }
    return $false
}

# Check if running as admin, relaunch if needed
if (Run-ScriptAsAdmin) {
    return
}





# Script to restart the "OnPortalNodeService"

# Check if the script is running with administrative privileges
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Please run this script as an administrator."
    exit
}

# Define the service name
$serviceName = "OnPortalNodeService"

# Check if the service exists
if (-not (Get-Service -Name $serviceName -ErrorAction SilentlyContinue)) {
    Write-Host "The service '$serviceName' was not found."
    exit
}

# Restart the service
Restart-Service -Name $serviceName

Write-Host "The service '$serviceName' has been restarted."
