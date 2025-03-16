### Linux bootable media does not work with Secure boot
https://community.veeam.com/discussion-boards-66/linux-bootable-media-does-not-work-with-secure-boot-4136

### Veeam Agent for Microsoft Windows
https://www.veeam.com/agent-for-windows-community-edition.html

### Installing the Veeam Agent for Linux
https://community.hetzner.com/tutorials/getting-started-with-veeam/installing-the-veeam-agent-for-linux
https://www.veeam.com/products/free/linux-download.html
https://helpcenter.veeam.com/docs/agentforlinux/userguide/installation_val.html?ver=60#dep
https://phoenixnap.com/kb/install-vmware-workstation-ubuntu

```bash
sudo dpkg -i ./veeam-release*
sudo apt-get update
apt-get install xorriso cifs-utils blksnap veeam
sudo veeam
```

### Veeam Agent for Mac
https://www.veeam.com/products/physical/mac-backup-recovery-download.html

### Can't backup to network share without credentials on Windows
https://forums.veeam.com/veeam-agent-for-windows-f33/unable-to-see-smb-share-with-veeam-for-windows-free-edition-t56695.html
https://forums.veeam.com/veeam-agent-for-windows-f33/can-t-backup-to-network-share-without-credentials-on-windows-t29564.html

You are trying to use an unsecured NAS with Windows 10? The problem might be Windows itself, not VEEAM.
Try setting this reg-key:

Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation]
"AllowInsecureGuestAuth"=dword:00000001

https://forums.veeam.com/veeam-agent-for-windows-f33/can-t-backup-to-network-share-without-credentials-on-windows-t29564.html#p374940
https://learn.microsoft.com/en-US/troubleshoot/windows-server/networking/guest-access-in-smb2-is-disabled-by-default

### Veeam Agent for Microsoft Windows 6
https://helpcenter.veeam.com/docs/agentforwindows/userguide/backup_job_share.html?ver=60

