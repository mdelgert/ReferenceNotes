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
sudo apt dist-upgrade

# Shut down
wsl --shutdown

# Install ssh server
sudo apt install openssh-server

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