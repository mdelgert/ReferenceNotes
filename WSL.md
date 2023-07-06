https://linux.how2shout.com/how-to-start-wsl-services-automatically-on-ubuntu-with-windows-10-startup/

create wsl_ssh.bat
wsl sudo service ssh start
run shell:startup copy file
sudo nano 99-snapd.conf
%sudo ALL=(ALL) NOPASSWD: /usr/sbin/service ssh *

# It appears that Microsoft broke the capability of starting WSL as a service or a scheduled task when is was moved to their store because it will no longer run in session 0.
# These conclusions can be inferred from the discussions with Microsoft's Windows Subsystem for Linux teams found on here on github.
# akes it less useful for sure. Only info from MS is they are working on it. Whether they are remains to be seen.
https://superuser.com/questions/1754734/how-to-run-wsl-on-windows-11-boot-as-service

https://github.com/microsoft/WSL/issues/9231#issuecomment-1383674435

netsh advfirewall firewall delete rule name="OpenSSH Server"
New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22

Host openssh_win32
    Hostname your_computer.local
    User windows_username

Host openssh_wsl
   ProxyJump openssh_win32
   User wsl_username
   HostName localhost
   Port 2222

ssh openssh_wsl

# WSL commands
https://devblogs.microsoft.com/commandline/systemd-support-is-now-available-in-wsl/
wsl --version
wsl --update
systemctl list-unit-files --type=service

https://patrick.wagstrom.net/weblog/2021/11/26/a-better-ssh-for-wsl2/
https://dev.to/composite/a-tiny-but-perfect-guide-how-to-install-wsl-2-on-windows-server-2022-1a8f
https://prolincur.com/blog/wslssh/

# Configuring SSH access into WSL 1 and WSL 2
https://linux.how2shout.com/how-to-start-wsl-services-automatically-on-ubuntu-with-windows-10-startup/
https://jmmv.dev/2022/02/wsl-ssh-access.html
https://www.youtube.com/watch?v=VjkE4dqdHX8&t=190
https://www.hanselman.com/blog/how-to-ssh-into-wsl2-on-windows-10-from-an-external-machine
https://gist.github.com/daehahn/497fa04c0156b1a762c70ff3f9f7edae?WT.mc_id=-blog-scottha
https://aspiringcraftsman.com/2022/07/01/ssh-on-wsl.html

sudo apt install openssh-server

sudo ssh-keygen -A

sudo systemctl enable ssh
sudo systemctl status ssh
sudo nano /etc/wsl.conf
[boot]
systemd=true
wsl --shutdown

sudo mkdir -p /etc/systemd/system/ssh.socket.d
sudo nano /etc/systemd/system/ssh.socket.d/listen.conf

[Socket]
ListenStream=
ListenStream=22

sudo systemctl daemon-reload
sudo systemctl restart ssh
sudo systemctl status ssh

sudo sed -i -E 's,^#?Port.*$,Port 2222,' /etc/ssh/sshd_config
sudo service ssh restart
sudo sh -c "echo '${USER} ALL=(root) NOPASSWD: /usr/sbin/service ssh start' >/etc/sudoers.d/service-ssh-start"
netsh advfirewall firewall delete rule name="OpenSSH Server (sshd) for WSL"
New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd) for WSL' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22

# WSL Startup
wsl sudo service ssh start

# Setup port proxy to WSL
netsh interface portproxy delete v4tov4 listenport=22 listenaddress=0.0.0.0 protocol=tcp
netsh interface portproxy add v4tov4 listenport=22 listenaddress=0.0.0.0 connectport=22 connectaddress=172.19.50.237

# WSL Install
https://pureinfotech.com/install-wsl-windows-11/#:~:text=To%20install%20WSL%20on%20Windows,d%20DISTRO%2DNAME%E2%80%9D%20command.
wsl --install

# Install Docker in WSL 2 without Docker Desktop
https://nickjanetakis.com/blog/install-docker-in-wsl-2-without-docker-desktop

# Cleanup
https://superuser.com/questions/1714736/cannot-run-wsl2-over-ssh-on-windows-11
Remove all linux installs from the app store
remove windows features virtual platform and wsl

# Add WSL folders to exclusion list
https://gist.github.com/noelbundick/9c804a710eb76e1d6a234b14abf42a52#file-excludewsl-ps1
PowerShell.exe -ExecutionPolicy Bypass

# How to Shrink a WSL2 Virtual Disk - https://stephenreescarter.net/how-to-shrink-a-wsl2-virtual-disk/
wsl --list --verbose
wsl --shutdown
diskpart
select vdisk file="%USERPROFILE%\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu22.04LTS_79rhkp1fndgsc\LocalState\ext4.vhdx"
compact vdisk

# The windows utility diskpart can now be used to shrink Virtual Hard Disk (vhdx) files provided you freed up the space inside it by deleting any unnecessary files.
https://stackoverflow.com/questions/70946140/docker-desktop-wsl-ext4-vhdx-too-large

# The warning message you received is related to the storage space usage within your WSLv2 environment, specifically the VHDX file that represents the virtual hard disk for # your WSL instance. The warning suggests that you may need to optimize the VHDX file to prevent running out of storage space.
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-Management-PowerShell

wsl --shutdown
%USERPROFILE%\AppData\Local\Packages\<WSL-DISTRIBUTION-NAME>\LocalState
wsl Optimize-VHD -Path <VHDX-PATH> -Mode Full

# WSL backup
wsl --export Ubuntu-22.04 C:\Backups\20233006_V1_Ubuntu22.04.tar
wsl --export Ubuntu-22.04 C:\Backups\20233006_V2_Ubuntu22.04.tar

# WSL enable history
shopt histreedit && echo "History not discarded" || echo "History discarded"
shopt -u histreedit

# WSL restore
wsl --import Test C:\Data\Test C:\Backups\20233006_V1_Ubuntu22.04.tar

# Here's how you can configure passwordless sudo access in WSL Ubuntu:
sudo visudo
username ALL=(ALL) NOPASSWD: ALL

# To set a default WSL (Windows Subsystem for Linux) distribution in Windows 10 or Windows 11, you can follow these steps:
wsl --set-default Ubuntu-22.04

# Show all instances installed
wsl --list --verbose

# WSL installation location: 
C:\Users\<Username>\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu20.04onWindows_<RandomString>

[Install Linux on Windows with WSL](https://learn.microsoft.com/en-us/windows/wsl/install)

wsl --install

[Download the Linux kernel update package](https://learn.microsoft.com/en-us/windows/wsl/install-manual#step-4---download-the-linux-kernel-update-package)

[Frequently Asked Questions about Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/faq)

# See status
wsl --status

# Update WSL
wsl --update

# How do I uninstall a WSL Distribution?
wsl --unregister Ubuntu
wsl --unregister Ubuntu-20.04
wsl --unregister Ubuntu-22.04

# Change the default Linux distribution installed
wsl --install -d Ubuntu-20.04
wsl --install -d Ubuntu-22.04

# to see a list of available Linux distributions available for download
wsl -l -o

# Run distro
wsl -d Ubuntu-20.04

# Setting up the GUI
https://learn.microsoft.com/en-us/windows/wsl/tutorials/gui-apps
https://medium.com/@japheth.yates/the-complete-wsl2-gui-setup-2582828f4577
https://github.com/microsoft/wslg/wiki/Diagnosing-%22cannot-open-display%22-type-issues-with-WSLg
https://github.com/microsoft/WSL/issues/8072
https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc771525(v=ws.10)?redirectedfrom=MSDN
https://learn.microsoft.com/en-us/windows/wsl/store-release-notes
https://answers.microsoft.com/en-us/windows/forum/all/kb4565503-installed-then-wsl-2-failed-to-start/25794c4f-0b20-465e-bbdb-a8af3d9e0e88
https://github.com/microsoft/WSL/issues/4920

C:\Users\user\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu20.04onWindows_79rhkp1fndgsc\LocalState\ext4.vhdx

https://github.com/microsoft/WSL/issues/8072

Today wsl reminded me that I can upgrade it to a new version, but after I upgraded it I can't open wsl in the ssh connection.
So I found this answer Cannot run WSL2 over ssh.

I found that there was an app in my app list called "Windows Subsystem For Linux Preview" that I just installed today. After uninstalling this app, everything went back to normal.

Start Menu -> Settings -> Apps

Find and uninstall Windows Subsystem For Linux Preview.
Hope it could help everyone

# GUI apps
apt install nautilus -y
apt install neofetch

https://www.windowscentral.com/how-add-gui-package-manager-ubuntu-windows-subsystem-linux-wsl
sudo apt install synaptic