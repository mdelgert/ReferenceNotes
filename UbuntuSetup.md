# Reference
https://www.simplehelp.net/2009/05/27/how-to-stop-ubuntu-from-asking-for-your-sudo-password/
https://linuxconfig.org/configure-sudo-without-password-on-ubuntu-20-04-focal-fossa-linux
https://help.ubuntu.com/community/RootSudo
https://github.com/teopost/MyNotes/blob/master/disable-authentication-for-ubuntu-software-center-updates.md
https://thirddriver.medium.com/jetbrains-toolbox-the-best-way-to-install-intellij-idea-on-linux-53c1070cd03b
https://askubuntu.com/questions/1410885/how-to-install-jetbrains-toolbox-in-ubuntu-22-04-lts
https://gist.github.com/greeflas/431bc50c23532eee8a7d6c1d603f3921
https://learn.microsoft.com/en-us/dotnet/core/install/linux-ubuntu
https://itsfoss.com/laptop-lid-suspend-ubuntu/#:~:text=Method%201%3A%20Using%20GNOME%20Tweaks&text=Once%20installed%2C%20start%20the%20Tweaks,laptop%20lid%20is%20closed'%20button.&text=That's%20it.,for%20changes%20to%20take%20effect.
https://www.makeuseof.com/how-to-install-visual-studio-code-ubuntu/
https://askubuntu.com/questions/1411104/unable-to-update-snap-store-cannot-refresh-snap-store-snap-snap-store-ha
https://www.sysprobs.com/fix-ubuntu-software-center-not-loading-issue
https://www.maketecheasier.com/ubuntu-software-center-not-working-fixes/
https://flathub.org/
https://docs.docker.com/engine/install/ubuntu/
https://www.digitalocean.com/community/questions/how-to-fix-docker-got-permission-denied-while-trying-to-connect-to-the-docker-daemon-socket

# How to Configure Ubuntu’s Built-In Firewall
https://www.howtogeek.com/115116/how-to-configure-ubuntus-built-in-firewall/
sudo apt-get install gufw

# Docker setup
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo docker run hello-world

# How to fix docker: Got permission denied while trying to connect to the Docker daemon socket
sudo groupadd docker
sudo usermod -aG docker ${USER}
su -s ${USER}

# If you check your groups and docker groups is not listed even after logging out, you may have to restart Ubuntu. To avoid that, you can use the newgrp command liks this:
newgrp docker

# Use an Alternative to snap center
sudo apt install gnome-software
sudo apt install synaptic
sudo apt install flatpak

# 6 Ways To Fix The “Ubuntu Software Center Not Loading” Issue
killall snap-store
snap-store refresh
killall gnome-software
gnome-software refresh
sudo apt update && sudo apt -y upgrade
sudo apt install gnome-software
sudo apt update && sudo apt upgrade
sudo snap install snap-store

# Fix-5: Clear the Cache
sudo apt clean
sudo apt update

# Default packages
sudo apt-get install openssh-server
sudo apt-get install curl

# update snap store
snap-store --quit && sudo snap refresh snap-store
# Allo run after lid close
nano /etc/systemd/logind.conf
LidSwitchIgnoreInhibited=yes
sudo service systemd-logind restart

# Guide: How to Share A Folder Between Ubuntu/Linux and Windows
sudo smbpasswd -a Username

# How to run sudo command without a password on a Linux or Unix
https://www.cyberciti.biz/faq/linux-unix-running-sudo-command-without-a-password/

cp /etc/sudoers /etc/sudoers.bak

visudo

# Allow sudo without password prompt
user ALL=(ALL) NOPASSWD:ALL