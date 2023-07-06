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