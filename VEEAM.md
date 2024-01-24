### Veeam Agent for Microsoft Windows
https://www.veeam.com/agent-for-windows-community-edition.html

### Installing the Veeam Agent for Linux
https://community.hetzner.com/tutorials/getting-started-with-veeam/installing-the-veeam-agent-for-linux

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

