function Enable-ICMPRules {
    # Enable ICMPv4 Echo Request for Private and Public profiles
    Get-NetFirewallRule -DisplayName "Core Networking Diagnostics - ICMP Echo Request (ICMPv4-In)" | Set-NetFirewallRule -Enabled True -Profile Private,Public

    # Enable ICMPv6 Echo Request for Private and Public profiles
    Get-NetFirewallRule -DisplayName "Core Networking Diagnostics - ICMP Echo Request (ICMPv6-In)" | Set-NetFirewallRule -Enabled True -Profile Private,Public
}

# Create a new rule to allow ICMP Echo (ping) for Private and Public profiles
New-NetFirewallRule -DisplayName "Allow Ping (ICMP Echo)" -Direction Inbound -Protocol ICMPv4 -IcmpType 8 -Action Allow -Profile Private,Public

# Call the function to enable existing rules
Enable-ICMPRules

# Display confirmation message
Write-Host "ICMP rules for ICMPv4 and ICMPv6 have been enabled, and 'Allow Ping (ICMP Echo)' rule has been created."
