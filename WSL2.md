# Install Windows OpenSSH Server
netsh advfirewall firewall delete rule name="OpenSSH Server"
New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22

# Install wsl
wsl --install

# See running instances
wsl --list 

# Install ssh server
sudo apt install openssh-server