# Reference
https://www.simplehelp.net/2009/05/27/how-to-stop-ubuntu-from-asking-for-your-sudo-password/

https://linuxconfig.org/configure-sudo-without-password-on-ubuntu-20-04-focal-fossa-linux

https://help.ubuntu.com/community/RootSudo

https://github.com/teopost/MyNotes/blob/master/disable-authentication-for-ubuntu-software-center-updates.md

https://thirddriver.medium.com/jetbrains-toolbox-the-best-way-to-install-intellij-idea-on-linux-53c1070cd03b

https://askubuntu.com/questions/1410885/how-to-install-jetbrains-toolbox-in-ubuntu-22-04-lts

https://gist.github.com/greeflas/431bc50c23532eee8a7d6c1d603f3921

https://learn.microsoft.com/en-us/dotnet/core/install/linux-ubuntu

# Guide: How to Share A Folder Between Ubuntu/Linux and Windows
sudo smbpasswd -a Username

# How to run sudo command without a password on a Linux or Unix
https://www.cyberciti.biz/faq/linux-unix-running-sudo-command-without-a-password/

cp /etc/sudoers /etc/sudoers.bak

visudo

# Allow sudo without password prompt
mdelgert ALL=(ALL) NOPASSWD:ALL