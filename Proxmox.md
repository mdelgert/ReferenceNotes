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