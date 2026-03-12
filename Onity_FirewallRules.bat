@echo off
setlocal
title Onity OnPortal Pre-Install Tool

:: --- ADMIN ELEVATION ---
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo [!] Requesting Admin Permissions...
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B
)
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%cd%"
CD /D "%~dp0"

cls
echo ======================================================
echo         ONITY ONPORTAL PRE-INSTALLATION SETUP
echo ======================================================
echo.
echo  Preparing system for OnPortal installation...
echo.
echo  [1] Disabling IPv6 on all network adapters...
echo  [2] Flushing DNS Cache...
echo  [3] Creating Firewall Rules for Port 6543...
echo  [4] Enabling ICMP (Ping) for Diagnostics...
echo  [5] Generating Setup Log on Desktop...
echo.
echo ------------------------------------------------------

:: --- FLUSH DNS & CACHE ---
ipconfig /flushdns >nul

:: --- POWERSHELL EXECUTION & LOGGING ---
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command ^
    "$logPath = \"$env:USERPROFILE\Desktop\OnPortal_Setup_Log.txt\";" ^
    "Start-Transcript -Path $logPath -Force | Out-Null;" ^
    "Disable-NetAdapterBinding -Name '*' -ComponentID ms_tcpip6 -ErrorAction SilentlyContinue;" ^
    "Write-Host ' [+] IPv6 Disabled on all network adapters' -ForegroundColor Cyan;" ^
    "$rules = @('Onity Inbound (6543)', 'Onity Outbound (6543)', 'Allow Ping (ICMP Echo)');" ^
    "foreach ($rule in $rules) {" ^
    "    if (!(Get-NetFirewallRule -DisplayName $rule -ErrorAction SilentlyContinue)) {" ^
    "        if ($rule -like '*Inbound*') { New-NetFirewallRule -DisplayName $rule -Direction Inbound -LocalPort 6543 -Protocol TCP -Action Allow -Profile Any | Out-Null }" ^
    "        if ($rule -like '*Outbound*') { New-NetFirewallRule -DisplayName $rule -Direction Outbound -LocalPort 6543 -Protocol TCP -Action Allow -Profile Any | Out-Null }" ^
    "        if ($rule -like '*Ping*') { New-NetFirewallRule -DisplayName $rule -Direction Inbound -Protocol ICMPv4 -IcmpType 8 -Action Allow -Profile Domain,Private,Public | Out-Null }" ^
    "        Write-Host \" [+] Created Firewall Rule: $rule\" -ForegroundColor Cyan;" ^
    "    } else { Write-Host \" [ok] Firewall Rule Exists: $rule\" -ForegroundColor Gray; }" ^
    "}" ^
    "Get-NetFirewallRule -DisplayName 'Core Networking Diagnostics - ICMP Echo Request (ICMPv4-In)' | Set-NetFirewallRule -Enabled True -Profile Domain,Private,Public;" ^
    "Write-Host ' [ok] System ICMP Rules Enabled (Domain/Private/Public)' -ForegroundColor Gray;" ^
    "Write-Host '';" ^
    "Stop-Transcript | Out-Null;"

:: --- FINAL STATUS CHECK ---
echo ------------------------------------------------------
echo  STATUS: System Prep Complete.
echo  RESULT: Ready to install Onity OnPortal.
echo  LOG: Saved to your Desktop.
echo.
echo  NOTE: If connection fails, check third-party EDR/AV 
echo  (CrowdStrike, SentinelOne) as they may block Port 6543.
echo ------------------------------------------------------
echo.
echo Press any key to close this window...
pause >nul
