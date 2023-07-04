# Configuring SSH Public Key Authentication on Windows
https://woshub.com/using-ssh-key-based-authentication-on-windows/
cat "C:\ProgramData\ssh\sshd_config"| Select-String "Authentication"

# Key-based authentication in OpenSSH for Windows
https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_keymanagement

[OpenSSH Server configuration for Windows Server and Windows](https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_server_configuration)

[THE EASY WAY how to SSH into Bash and WSL2 on Windows 10 from an external machine](https://www.hanselman.com/blog/the-easy-way-how-to-ssh-into-bash-and-wsl2-on-windows-10-from-an-external-machine)

[Install OpenSSH for Windows](https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse?tabs=gui)

(New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH*'

# Remove all previous versions
Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH*' | Remove-WindowsCapability -Online

# Install the client
dism /online /Add-Capability /CapabilityName:OpenSSH.Client~~~~0.0.1.0

# Install the server
dism /online /Add-Capability /CapabilityName:OpenSSH.Server~~~~0.0.1.0

# Start the sshd service
Start-Service sshd

# OPTIONAL but recommended:
Set-Service -Name sshd -StartupType 'Automatic'

# Confirm the Firewall rule is configured. It should be created automatically by setup. Run the following to verify
if (!(Get-NetFirewallRule -Name "OpenSSH-Server-In-TCP" -ErrorAction SilentlyContinue | Select-Object Name, Enabled)) {
    Write-Output "Firewall Rule 'OpenSSH-Server-In-TCP' does not exist, creating it..."
    New-NetFirewallRule -Name 'OpenSSH-Server-In-TCP' -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
} else {
    Write-Output "Firewall rule 'OpenSSH-Server-In-TCP' has been created and exists."
}

# Change shell to WSL
// New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -PropertyType String -Force

New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "C:\WINDOWS\System32\bash.exe" -PropertyType String -Force

# Modify .bashrc add the following line to the end so default is home directory
cd ~

[How to default to other directory instead of home directory](https://stackoverflow.com/questions/7017143/how-to-default-to-other-directory-instead-of-home-directory)

# Install the OpenSSH Client
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0

# Install the OpenSSH Server
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

# Uninstall the OpenSSH Client
Remove-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0

# Uninstall the OpenSSH Server
Remove-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

[cannot-run-wsl2-over-ssh-on-windows-11](https://superuser.com/questions/1714736/cannot-run-wsl2-over-ssh-on-windows-11)

The ability to launch WSL from within SSH, would be to uninstall the Preview version and then re-install with wsl --install in Windows 11.

# By default the ssh-agent service is disabled. Configure it to start automatically.
# Make sure you're running as an Administrator.
Get-Service ssh-agent | Set-Service -StartupType Automatic

# Start the service
Start-Service ssh-agent

# This should return a status of Running
Get-Service ssh-agent

# Now load your key files into ssh-agent
ssh-add $env:USERPROFILE\.ssh\SSH_Key

# Get the public key file generated previously on your client
$authorizedKey = Get-Content -Path $env:USERPROFILE\.ssh\SSH_Key.pub

# Generate the PowerShell to be run remote that will copy the public key file generated previously on your client to the authorized_keys file on your server
$remotePowershell = "powershell Add-Content -Force -Path $env:ProgramData\ssh\administrators_authorized_keys -Value '$authorizedKey';icacls.exe ""$env:ProgramData\ssh\administrators_authorized_keys"" /inheritance:r /grant ""Administrators:F"" /grant ""SYSTEM:F"""

# Connect to your server and run the PowerShell using the $remotePowerShell variable
ssh user@machine $remotePowershell

# Get the public key file generated previously on your client
$authorizedKey = Get-Content -Path $env:USERPROFILE\.ssh\SSH_Key.pub

# Generate the PowerShell to be run remote that will copy the public key file generated previously on your client to the authorized_keys file on your server
$remotePowershell = "powershell New-Item -Force -ItemType Directory -Path $env:USERPROFILE\.ssh; Add-Content -Force -Path $env:USERPROFILE\.ssh\authorized_keys -Value '$authorizedKey'"

# Connect to your server and run the PowerShell using the $remotePowerShell variable
ssh user@machine $remotePowershell

# Run commands
"%PROGRAMFILES%\Git\usr\bin\bash.exe" --login -i