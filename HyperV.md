### Links
https://techcommunity.microsoft.com/t5/educator-developer-blog/step-by-step-enabling-hyper-v-for-use-on-windows-11/ba-p/3745905
https://www.youtube.com/watch?v=vdmgmL1LOZQ
https://www.youtube.com/watch?v=WWzMrtj2Or8&t=216
https://blog.matrixpost.net/install-ubuntu-as-hyper-v-generation-2-virtual-machine/
https://github.com/Hinara/linux-vm-tools
https://github.com/Microsoft/linux-vm-tools/wiki/Onboarding:-Ubuntu
https://ubuntuforums.org/showthread.php?t=2481545
https://www.nakivo.com/blog/install-ubuntu-20-04-on-hyper-v-with-enhanced-session/
https://github.com/neutrinolabs/pulseaudio-module-xrdp/wiki/Build-on-Debian-or-Ubuntu

### Install Ubuntu as Hyper-V Generation 2 Virtual Machine
Go to settings, security enable secure boot with templage "Microsoft UEFI Certificate Authority"
Then click apply connect and start
https://blog.matrixpost.net/wp-content/uploads/2021/11/secure_boot_ubuntu.png

### Detailed Walkthrough: Install Ubuntu 20.04 on Hyper-V with Enhanced Session
```PS
Get-VM
Set-VM -VMName "your_vm" -EnhancedSessionTransportType HvSocket
```

```bash
wget https://raw.githubusercontent.com/Hinara/linux-vm-tools/ubuntu20-04/ubuntu/22.04/install.sh
sudo chmod +x install.sh
sudo ./install.sh
sudo reboot
```

Then login to xrd note that if user is logged in will not work, disable user auto login to desktop.

### Enable Sound Output Hyper-V 
```bash
sudo apt install build-essential dpkg-dev libpulse-dev git autoconf libtool
cd ~
git clone https://github.com/neutrinolabs/pulseaudio-module-xrdp.git
cd pulseaudio-module-xrdp
scripts/install_pulseaudio_sources_apt_wrapper.sh
./bootstrap && ./configure PULSE_DIR=$HOME/pulseaudio.src
make
sudo make install
reboot
```

# Then when it gets to the 'xrdp" login dialog, go to "Show Options" > "Local Resources" Tab > "Remote Audio" > Settings > Select "Play on This Computer".

# Enable xrdp on different port
```bash
sudo nano /etc/xrdp/xrdp.ini
#port=vsock://-1:3390
reboot
```

################################# If run github script no longer required #################################

### Check azure kernel
```bash
uname -a
#Linux ubuntu 5.11.0-1021-azure #22~20.04.1-Ubuntu SMP Fri Oct 29 01:11:25 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux
```

### To optimize the virtual machine for Microsoft Hyper-V install also the linux-azure package.
```bash
apt-get update
apt get-install linux-azure
reboot
```

### Changing Screen Resolution in Hyper-V Ubuntu VM
https://tecadmin.net/change-screen-resolution-of-an-ubuntu-vm-in-hyper-v/

```bash
sudo nano /etc/default/grub 
#GRUB_CMDLINE_LINUX_DEFAULT="quiet splash video=hyperv_fb:1920x1080"
sudo update-grub
sudo apt install linux-image-extra-virtual 
sudo reboot
```