# Install Proxmox Backup Server on Proxmox VE

# Remove Proxmox backup Subscription Notice
https://dannyda.com/2020/11/13/how-to-remove-you-do-not-have-a-valid-subscription-for-this-server-from-proxmox-backup-server-pbs-1-0-1/

```bash
sed -i.backup -z "s/res === null || res === undefined || \!res || res\n\t\t\t.data.status.toLowerCase() \!== 'active'/false/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js && systemctl restart proxmox-backup-proxy
```

# Install Proxmox Backup Server in an LXC Container
https://docs.jdbnet.co.uk/Proxmox/Install-Proxmox-Backup-Server-in-an-LXC-Container/

# proxmox-backup-arm64
https://github.com/wofferl/proxmox-backup-arm64
https://docs.jdbnet.co.uk/Proxmox/Install-Proxmox-Backup-Server-in-an-LXC-Container/

# Download packages
```bash
git clone https://github.com/wofferl/proxmox-backup-arm64.git
cd proxmox-backup-arm64
chmod +x build.sh
./build.sh download
```

# Server install
```bash
cd packages
sudo apt install \
  ./libjs-extjs_*_all.deb \
  ./libjs-qrcodejs_*_all.deb \
  ./libproxmox-acme-plugins_*_all.deb \
  ./pbs-i18n_*_all.deb \
  ./proxmox-backup-docs_*_all.deb \
  ./proxmox-backup-server_*_arm64.deb \
  ./proxmox-mini-journalreader_*_arm64.deb \
  ./proxmox-widget-toolkit_*_all.deb \
  ./proxmox-termproxy_*_arm64.deb \
  ./pve-xtermjs_*_all.deb
```

# Server commands
```bash
sudo proxmox-backup-manager user list #Check users
sudo proxmox-backup-manager user update root@pam --password {pwd} #Update password
```