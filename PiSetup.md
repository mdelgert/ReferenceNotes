#### Update
```bash
sudo apt update
sudo apt upgrade
```

#### Install utils
```bash
sudo apt install neofetch htop libsensors5
```

#### Disable Wifi and Bluetooth
[link](https://sleeplessbeastie.eu/2022/06/01/how-to-disable-onboard-wifi-and-bluetooth-on-raspberry-pi-4/)
```bash
echo "dtoverlay=disable-bt" | sudo tee -a /boot/config.txt
echo "dtoverlay=disable-wifi" | sudo tee -a /boot/config.txt
sudo systemctl disable hciuart
sudo reboot
```

### Verify
```bash
hcitool dev
iw dev
ip -br a
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

#### Static IP address
```bash
sudo nano /etc/dhcpcd.conf
-------------------------------------------------------------------------------------------------
interface eth0
static ip_address=192.168.0.10/24
static routers=192.168.0.1
static domain_name_servers=192.168.0.1
-------------------------------------------------------------------------------------------------
```
#### Docker setup
```bash
sudo curl -fsSL https://get.docker.com | bash
```

#### Docker add current user and compose
```bash
sudo usermod -aG docker $USER
```

#### Sanity check that both tools were installed successfully
```bash
docker --version
docker compose version
docker run mdelgert/hello-world
```

#### Enable TRIM
https://www.jeffgeerling.com/blog/2020/enabling-trim-on-external-ssd-on-raspberry-pi

```bash
apt-get install -y sg3-utils lsscsi
echo unmap > /sys/devices/platform/scb/fd500000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/usb2/2-1/2-1:1.0/host0/target0:0:0/0:0:0:0/scsi_disk/0:0:0:0/provisioning_mode
echo 2147450880 > /sys/block/sda/queue/discard_max_bytes
nano /etc/udev/rules.d/10-trim.rules
ACTION=="add|change", ATTRS{idVendor}=="174c", ATTRS{idProduct}=="55aa", SUBSYSTEM=="scsi_disk", ATTR{provisioning_mode}="unmap"
```
#### Automatic trimming
```bash
sudo systemctl enable fstrim.timer
```

#### Trim the drive
```bash
sudo fstrim -v /
```

#### DeskPi
```bash
git clone https://github.com/DeskPi-Team/deskpi.git
cd ~/deskpi/
chmod +x install-raspios-64bit.sh
sudo ./install-raspios-64bit.sh
```

#### Portainer
https://docs.portainer.io/start/install-ce/server/docker/linux
```bash
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
```
https://localhost:9443