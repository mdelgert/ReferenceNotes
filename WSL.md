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

# Change the default Linux distribution installed
wsl --install -d Ubuntu-20.04

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