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

function Enable-ICMPRules {
    # Enable ICMPv4 Echo Request for Private and Public profiles
    Get-NetFirewallRule -DisplayName "Core Networking Diagnostics - ICMP Echo Request (ICMPv4-In)" | Set-NetFirewallRule -Enabled True -Profile Private,Public

    # Enable ICMPv6 Echo Request for Private and Public profiles
    Get-NetFirewallRule -DisplayName "Core Networking Diagnostics - ICMP Echo Request (ICMPv6-In)" | Set-NetFirewallRule -Enabled True -Profile Private,Public
}

# Create a new rule to allow ICMP Echo (ping) for Private and Public profiles
New-NetFirewallRule -DisplayName "Allow Ping (ICMP Echo)" -Direction Inbound -Protocol ICMPv4 -IcmpType 8 -Action Allow -Profile Private,Public

# Create a new rule to allow inbound and outbound TCP traffic on port 6543 for all profiles
New-NetFirewallRule -DisplayName "onity" -Direction Inbound -LocalPort 6543 -Protocol TCP -Action Allow -Profile Any
New-NetFirewallRule -DisplayName "onity" -Direction Outbound -LocalPort 6543 -Protocol TCP -Action Allow -Profile Any

# Call the function to enable existing rules
Enable-ICMPRules

# Display confirmation message
Write-Host "ICMP rules for ICMPv4 and ICMPv6 have been enabled, and 'Allow Ping (ICMP Echo)' rule, along with the 'onity' rule for port 6543, have been created."

# Pause to see the output (optional)
Pause
