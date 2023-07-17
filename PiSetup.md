#### Update
```bash
sudo apt update
sudo apt upgrade
```

#### Install utils
```bash
sudo apt install neofetch htop libsensors5
```

#### Disable IPv6
```bash
sudo nano /etc/sysctl.conf
-------------------------------------------
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
-------------------------------------------
sudo sysctl -p
ip a | grep inet6
```

#### Disable wifi
```bash
sudo nano /etc/dhcpcd.conf
-------------------------------------------
denyinterfaces wlan0
denyinterfaces wlan1
-------------------------------------------
```

#### Static IP address
```bash
sudo nano /etc/dhcpcd.conf
-------------------------------------------------------------------------------------------------
interface eth0
static ip_address=192.168.0.10/24
static ip6_address=fd51:42f8:caae:d92e::ff/64
static routers=192.168.0.1
static domain_name_servers=192.168.0.1 8.8.8.8 fd51:42f8:caae:d92e::1
-------------------------------------------------------------------------------------------------
```
#### Docker setup
```bash
sudo curl -fsSL https://get.docker.com | bash
```
#### Docker add current user and compose
```bash
sudo usermod -aG docker $USER
sudo apt install docker-compose-plugin
```
#### Sanity check that both tools were installed successfully
```bash
docker --version
docker compose version
docker run mdelgert/hello-world
```
#### Portainer
https://docs.portainer.io/start/install-ce/server/docker/linux
```bash
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data 
```
portainer/portainer-ce:latest
https://localhost:9443

#### Enable TRIM
https://www.jeffgeerling.com/blog/2020/enabling-trim-on-external-ssd-on-raspberry-pi

```bash
sudo fstrim -v /
lsblk -D
sudo su
apt-get install -y sg3-utils lsscsi
sg_vpd -p bl /dev/sda
-------------------------------------------------------------------------------------------------
Maximum unmap LBA count: 4194240
Maximum unmap block descriptor count: 1
-------------------------------------------------------------------------------------------------
sg_vpd -p lbpv /dev/sda
find /sys/ -name provisioning_mode -exec grep -H . {} + | sort
-------------------------------------------------------------------------------------------------
/sys/devices/platform/scb/fd500000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/usb2/2-1/2-1:1.0/host0/target0:0:0/0:0:0:0/scsi_disk/0:0:0:0/provisioning_mode:full
-------------------------------------------------------------------------------------------------
lsscsi
-------------------------------------------------------------------------------------------------
[0:0:0:0]    disk    Samsung  SSD 870 EVO 2TB  0     /dev/sda 
-------------------------------------------------------------------------------------------------
echo unmap > /sys/devices/platform/scb/fd500000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/usb2/2-1/2-1:1.0/host0/target0:0:0/0:0:0:0/scsi_disk/0:0:0:0/provisioning_mode
find /sys/ -name provisioning_mode -exec grep -H . {} + | sort
echo $((4194240*512))
echo 2147450880 > /sys/block/sda/queue/discard_max_bytes
fstrim -v /
lsusb
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
Bus 002 Device 002: ID 174c:55aa ASMedia Technology Inc. ASM1051E SATA 6Gb/s bridge, ASM1053E SATA 6Gb/s bridge, ASM1153 SATA 3Gb/s bridge, ASM1153E SATA 6Gb/s bridge
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
nano /etc/udev/rules.d/10-trim.rules
ACTION=="add|change", ATTRS{idVendor}=="174c", ATTRS{idProduct}=="55aa", SUBSYSTEM=="scsi_disk", ATTR{provisioning_mode}="unmap"
```
#### Automatic trimming
```bash
sudo systemctl enable fstrim.timer
```