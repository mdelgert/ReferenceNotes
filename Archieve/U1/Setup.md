https://www.linuxtechi.com/how-to-install-kvm-on-ubuntu-22-04/
https://superuser.com/questions/132322/how-to-increase-the-visualized-screen-resolution-on-qemu-kvm
https://www.spice-space.org/download.html
https://ubuntu.com/server/docs/libvirt
https://serverfault.com/questions/1075408/can-i-have-my-kvm-guests-on-the-same-subnet-as-the-host
https://www.dzombak.com/blog/2024/02/Setting-up-KVM-virtual-machines-using-a-bridged-network.htmlhttps://www.dzombak.com/blog/2024/02/Setting-up-KVM-virtual-machines-using-a-bridged-network.html

# Check virtualization
```bash
sudo apt install -y cpu-checker
egrep -c '(vmx|svm)' /proc/cpuinfo
kvm-ok
sudo apt install -y qemu-kvm virt-manager libvirt-daemon-system virtinst libvirt-clients bridge-utils
sudo systemctl enable --now libvirtd
sudo systemctl start libvirtd
sudo systemctl status libvirtd
sudo usermod -aG kvm $USER
sudo usermod -aG libvirt $USER
sudo nano /etc/netplan/01-netcfg.yaml
```

# Example 1
network:
  ethernets:
    enp0s3:
      dhcp4: false
      dhcp6: false
  # add configuration for bridge interface
  bridges:
    br0:
      interfaces: [enp0s3]
      dhcp4: false
      addresses: [192.168.1.162/24]
      macaddress: 08:00:27:4b:1d:45
      routes:
        - to: default
          via: 192.168.1.1
          metric: 100
      nameservers:
        addresses: [4.2.2.2]
      parameters:
        stp: false
      dhcp6: false
  version: 2


# Example 2
network:
  ethernets:
    wlp0s20f3:
      dhcp4: false
  bridges:
    br0:
      interfaces: [wlp0s20f3]
      dhcp4: true
      mtu: 1500
      parameters:
        stp: true
        forward-delay: 15

# Get nic address
```bash
ip add
```

# Example 3
network:
  version: 2
  ethernets:
    enp0s31f6:
      dhcp4: true
  bridges:
    br0:
      dhcp4: yes
      interfaces:
        - enp0s31f6

sudo nano /etc/netplan/kvm-hostbridge.xml

# Example
<network>
  <name>hostbridge</name>
  <forward mode="bridge"/>
  <bridge name="br0"/>
</network>

virsh net-define /etc/netplan/kvm-hostbridge.xml
virsh net-start hostbridge
virsh net-autostart hostbridge

# Apply verify and reboot
```bash
sudo netplan apply
ip add show
sudo reboot
```

virsh net-list
virsh net-info hostbridge
virsh net-dhcp-leases hostbridge
sudo brctl show br0