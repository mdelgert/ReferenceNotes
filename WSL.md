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

