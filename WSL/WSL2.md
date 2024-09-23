# Cannot run WSL2 over SSH on Windows 11
https://superuser.com/questions/1714736/cannot-run-wsl2-over-ssh-on-windows-11
https://superuser.com/questions/1714397/wsl-2-0-the-file-cannot-be-accessed-by-the-system/1758189#1758189
https://github.com/microsoft/WSL/issues/9197
https://carteakey.dev/remoting-into-wsl2-externally-the-easy-way/

PS > & 'C:\Program Files\WSL\wsl.exe'
CMD > "c:\Program Files\WSL\wsl.exe"

# Install Windows OpenSSH Server
netsh advfirewall firewall delete rule name="OpenSSH Server"
New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22

# Install wsl
wsl --install

# See running
wsl --list

# See online distros
wsl --list --online

# Remove a distro
wsl --unregister Ubuntu

# Install a distro
wsl --install -d Ubuntu

# Update
sudo apt update
sudo apt upgrade

# Shut down
wsl --shutdown

# Install ssh server and neo fetch
sudo apt install openssh-server neofetch

# See status
sudo systemctl status ssh

# Set port
sudo sed -i -E 's,^#?Port.*$,Port 2022,' /etc/ssh/sshd_config

# Restart and check ssh
sudo systemctl restart ssh
sudo systemctl status ssh

# Enable authorized keys
cd ~
mkdir .ssh
touch authorized_keys

# Create jump connection - https://github.com/microsoft/WSL/issues/9231#issuecomment-1383674435
# New WSL seems locked down does not appear allowed to autostart from task. Must login and run WSL for SSH jump to work.
Host openssh_win32
    IdentityFile ~/.ssh/Key
	IdentitiesOnly yes

Host openssh_wsl
   ProxyJump openssh_win32
   HostName localhost
   Port 2022
   IdentityFile ~/.ssh/Key
   IdentitiesOnly yes

# Passwordless sudo access in WSL Ubuntu:
sudo visudo
username ALL=(ALL) NOPASSWD: ALL   