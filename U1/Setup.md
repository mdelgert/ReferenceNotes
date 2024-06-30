https://www.linuxtechi.com/how-to-install-kvm-on-ubuntu-22-04/

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

# Example
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

# Apply verify and reboot
```bash
sudo netplan apply
ip add show
sudo reboot
```