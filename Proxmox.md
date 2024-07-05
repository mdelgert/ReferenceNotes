# Proxmox VE Storage
https://pve.proxmox.com/pve-docs/pve-admin-guide.html#_storage_types

# Qemu-guest-agent
https://pve.proxmox.com/wiki/Qemu-guest-agent

```bash
apt-get install qemu-guest-agent
systemctl start qemu-guest-agent
systemctl enable qemu-guest-agent
```

# Remove Proxmox Subscription Notice
https://johnscs.com/remove-proxmox51-subscription-notice/

```bash
sed -Ezi.bak "s/(function\(orig_cmd\) \{)/\1\n\torig_cmd\(\);\n\treturn;/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js && systemctl restart pveproxy.service
```

# Remove Proxmox backup Subscription Notice
https://dannyda.com/2020/11/13/how-to-remove-you-do-not-have-a-valid-subscription-for-this-server-from-proxmox-backup-server-pbs-1-0-1/

```bash
sed -i.backup -z "s/res === null || res === undefined || \!res || res\n\t\t\t.data.status.toLowerCase() \!== 'active'/false/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js && systemctl restart proxmox-backup-proxy
```

# How to Configure the Firewall on Proxmox
https://www.wundertech.net/how-to-configure-the-firewall-on-proxmox/

# Windows VirtIO Drivers
https://pve.proxmox.com/wiki/Windows_VirtIO_Drivers
https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso

# GNU/Linux Machine to Proxmox LXC Container Converter
https://github.com/my5t3ry/machine-to-proxmox-lxc-ct-converter

# Disable lid switch
https://www.reddit.com/r/Proxmox/comments/kxdjrc/i_am_running_proxmox_on_a_thinkpad_laptop_how_can/

```bash
nano /etc/systemd/logind.conf
systemctl restart systemd-logind
```

# Example
HandleLidSwitch=ignore

# Virtualize Windows 11 with Proxmox
https://www.youtube.com/watch?v=fupuTkkKPDU&t=333s

# Install Guest Agent and Services
https://github.com/Zer0CoolX/proxmox-windows-slipstream-virtio-drivers/tree/master
https://pve.proxmox.com/wiki/Windows_10_guest_best_practices#Drivers_and_Services
https://github.com/virtio-win/virtio-win-pkg-scripts/blob/master/README.md
https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso
https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.248-1/virtio-win.iso
https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/latest-virtio/virtio-win-guest-tools.exe

# SPICE Enhancements 
https://pve1.vessea.com/pve-docs/chapter-qm.html#qm_spice_enhancements

# SMB, CIFS share provided by Proxmox
https://www.reddit.com/r/Proxmox/comments/mco03f/smb_cifs_share_provided_by_proxmox/
