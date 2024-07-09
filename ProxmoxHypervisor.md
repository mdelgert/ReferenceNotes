# Exspand lvm
```bash
lsblk #Identify the New Drive: Check which new drive you have added to the system.
fdisk /dev/nvme1n1 #Partition the New Drive (Optional, if needed): Create a new partition on the drive (n use defaults)
pvcreate /dev/nvme1n1p1 #Create a Physical Volume: Initialize the new partition or disk for LVM.
vgdisplay #Identify the Volume Group: List the volume groups to find the one you want to extend.
vgextend pve /dev/nvme1n1p1 #Extend the Volume Group: Add the new physical volume to the volume group.
lvs #Identify the Thin Pool: Find the thin pool that you want to expand.
lvextend -l +100%FREE pve/data
```

# Add USB drive
```bash
lsblk
fdisk -l
fdisk /dev/sdb #command n (new) p (primary select defaults) w (write the changes)
mkfs.ext4 /dev/sdb #select defaults
mkdir /mnt/usb1
mount /dev/sdb /mnt/usb1 
df -h #see the new mount
echo '/dev/sdb /mnt/usb1 ext4 defaults 0 2' >> /etc/fstab
```

Then in storage manager add directory /mnt/usb1

# Network
```bash
cp /etc/network/interfaces /etc/network/interfaces.bk
nano /etc/network/interfaces
systemctl restart networking
```

# Example interfaces
auto lo
iface lo inet loopback

auto eno1
iface eno1 inet static
    address 192.168.50.245
    netmask 255.255.255.0
    gateway 192.168.50.1

auto enp3s0
iface enp3s0 inet manual
auto vmbr0
iface vmbr0 inet static
    bridge_ports enp3s0
    bridge_stp off
    bridge_fd 0

iface wlp4s0 inet manual

source /etc/network/interfaces.d/*

# Storage config location
```bash
nano /etc/pve/storage.cfg
```

# Links
https://www.howtogeek.com/40702/how-to-manage-and-use-lvm-logical-volume-management-in-ubuntu/
https://gist.github.com/andrewfraley/faa03abc70b7f2b1bd8ec95dc962ba5d

# Don’t run Proxmox without these settings!
https://www.youtube.com/watch?v=VAJWUZ3sTSI

# Update templates
https://pve.proxmox.com/wiki/Linux_Container

```bash
pveam update
pveam available
```

# Setup notifications with docker and Gotify
```bash
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

docker run -p 80:80 -e TZ="America/New_York" -v /var/gotify/data:/app/data gotify/server

curl "server/message?token=secret" -F "title=Hello" -F "message=World" -F "priority=5"
```

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
