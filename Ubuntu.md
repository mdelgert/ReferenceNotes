# Install ssh
apt-get install openssh-server
apt install net-tools

# Fix sudo https://linuxconfig.org/configure-sudo-without-password-on-ubuntu-20-04-focal-fossa-linux
sudo visudo

%sudo   ALL=(ALL:ALL) NOPASSWD:ALL

# Disable keyring 
https://askubuntu.com/questions/1296932/screen-sharing-in-unusable-state-after-rebooting

1. Open the "Passwords and Keys" application
2. Right click on the "Login" keyring and hit "Change password". Example
3. Enter your password (likely your login password unless you've changed it)
4. For the new password enter blank -- you should get a warning that the keyring will always be unlocked.
5. Reboot and re-enable VNC one more time
6. Reboot once more to make sure it's still working.

# How to Enable Remote Desktop on Ubuntu Desktop 22.04 LTS and Access it from Windows Remote Desktop Connection App
https://linuxhint.com/enable-remote-desktop-ubuntu-access-from-windows/

# Ubuntu certified desktops
https://ubuntu.com/certified/desktops?q=&release=20.04+LTS

# Pending Update of Snap Store
https://askubuntu.com/questions/1412575/pending-update-of-snap-store
sudo snap refresh snap-store
error: cannot refresh "snap-store": snap "snap-store" has running apps (ubuntu-software), pids:
       2452

kill 2452
sudo snap refresh snap-store