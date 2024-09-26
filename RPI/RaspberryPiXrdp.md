https://linuxize.com/post/how-to-install-xrdp-on-raspberry-pi/
https://www.datenreise.de/en/raspberry-pi-install-remote-desktop-xrdp/
https://pimylifeup.com/raspberry-pi-remote-desktop/
https://raspberrypi.stackexchange.com/questions/133425/connection-problem-giving-up-on-xrdp-with-raspberry-pi-os-11-bullseye

# Turns out you cannot login twice with the same account using xrdp on Raspbian Bullseye (Debian 11). So you need to either disable autologin using "Raspberry Pi Configuration"/sudo raspi-config or create another user. If this is not an option because you need to login as the same user then you might want to look into VNC, Teamviewer or go back to Raspbian Buster (Debian 10).

# Unfortunately, XRDP does not work with the new Raspbian Image right away. The integrated RealVNC Server and XRDP are in conflict and cannot be used together. To resolve this conflict, RealVNC must be uninstalled before installing XRDP:
sudo apt-get purge realvnc-vnc-server

# 4. However, we are required to make a user in which you will use for your remote desktop connection to your Raspberry Pi. The default user you create does not work with XRDP.
sudo adduser USERNAME

# How to Install Xrdp Server (Remote Desktop) on Raspberry Pi
sudo apt update
sudo apt-get install raspberrypi-ui-mods xinit xserver-xorg
sudo reboot
sudo apt install xrdp
systemctl show -p SubState --value xrdp
sudo adduser xrdp ssl-cert
