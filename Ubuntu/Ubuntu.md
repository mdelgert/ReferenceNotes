# Xrdp
https://www.anyviewer.com/how-to/rdp-multiple-monitors-not-working-2578.html
sudo apt install xrdp
sudo nano /etc/xrdp/xrdp.ini
sudo systemctl restart xrdp
Make sure to logout and disable auto login because same user can not be logged in both places or xrdp will just close

# xRDP – The Infamous “Authentication Required to Create Managed Color Device” Explained
https://c-nergy.be/blog/?p=12073
https://askubuntu.com/questions/1318473/authentication-required-popup/1373856#1373856

sudo nano /etc/polkit-1/localauthority/50-local.d/45-remote-desktop-sanity.pkla

[Allow Network Manager for Myself]
Identity=unix-user:mdelgert
Action=org.freedesktop.NetworkManager.*
ResultAny=yes
ResultInactive=yes
ResultActive=yes

[Allow Login, Shutdown, Restart, Etc for Myself]
Identity=unix-user:mdelgert
Action=org.freedesktop.login1.*
ResultAny=yes
ResultInactive=yes
ResultActive=yes

[Allow Colord all Users]
Identity=unix-user:*
Action=org.freedesktop.color-manager.create-device;org.freedesktop.color-manager.create-profile;org.freedesktop.color-manager.delete-device;org.freedesktop.color-manager.delete-profile;org.freedesktop.color-manager.modify-device;org.freedesktop.color-manager.modify-profile
ResultAny=no
ResultInactive=no
ResultActive=yes

[Allow Package Management all Users]
Identity=unix-user:*
Action=org.freedesktop.packagekit.system-sources-refresh
ResultAny=yes
ResultInactive=yes
ResultActive=yes

# Util
sudo apt install net-tools neofetch

# How to Fix "WARNING: UNPROTECTED PRIVATE KEY FILE!" on Mac and Linux
https://stackabuse.com/how-to-fix-warning-unprotected-private-key-file-on-mac-and-linux/

sudo chmod 600 ~/.ssh/SSH_Key

# Install ssh
apt-get install openssh-server
apt install net-tools

# Fix sudo https://linuxconfig.org/configure-sudo-without-password-on-ubuntu-20-04-focal-fossa-linux
sudo visudo

%sudo ALL=(ALL:ALL) NOPASSWD:ALL

# Add sudo to one single account
youraccount ALL=(ALL) NOPASSWD:ALL

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