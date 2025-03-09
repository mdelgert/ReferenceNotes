# Define registry path

$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"

# Ensure the registry path exists

if (!(Test-Path $RegPath)) {

New-Item -Path $RegPath -Force | Out-Null

}

# Set the registry values

Set-ItemProperty -Path $RegPath -Name "fServerNetworkDetect" -Type DWord -Value 1

Set-ItemProperty -Path $RegPath -Name "fTurnOffTimeDetect" -Type DWord -Value 1

Set-ItemProperty -Path $RegPath -Name "fTurnOffNetworkDetect" -Type DWord -Value 1

# Confirm changes

Write-Host "Network detection policies applied. A reboot may be required for changes to take effect."