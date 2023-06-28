# Stress Testing Your Raspberry Pi (for Cooling and Overclocking)
sudo apt-get install stress

wget https://raw.githubusercontent.com/ssvb/cpuburn-arm/master/cpuburn-a53.S

gcc -o cpuburn-a53 cpuburn-a53.S

# PiShrink
https://www.tomshardware.com/how-to/back-up-raspberry-pi-as-disk-image
https://github.com/Drewsif/PiShrink

lsblk
sudo fdisk -l

sudo dd if=/dev/mmcblk0 of=/home/mdelgert/Backups/test.img bs=1M status=progress
sudo dd if=/dev/sda of=/home/mdelgert/Backups/test.img bs=1M status=progress
sudo dd if=/dev/sda | gzip > /home/mdelgert/Backups/test.img.gz
sudo dd if=/dev/sda status=progress | gzip > /home/mdelgert/Backups/test.img.gz

# Pi-Apps
https://pi-apps.io/

# Enabling TRIM on an external SSD on a Raspberry Pi
https://www.jeffgeerling.com/blog/2020/enabling-trim-on-external-ssd-on-raspberry-pi
https://github.com/muhkuh-sys/raspberry_enable_trim
https://www.tomshardware.com/news/maker-breaks-down-how-the-raspberry-pi-supports-trim-on-ssds

# The Ultimate Guide to Backup and Restore your Raspberry Pi
https://raspberrytips.com/backup-raspberry-pi/

# Stress tests and temperature plots for the Raspberry Pi
https://www.zdnet.com/article/how-to-overclock-and-stress-test-your-raspberry-pi/
https://github.com/nschloe/stressberry
sudo apt install stress
sudo pip3 install stressberry

# How to Setup a Raspberry Pi Samba Server
https://pimylifeup.com/raspberry-pi-samba/
sudo apt-get install samba samba-common-bin
mkdir /home/pi/shared
sudo nano /etc/samba/smb.conf
sudo smbpasswd -a pi
sudo systemctl restart smbd

# Add to bottom
[shared]
path = /home/pi/shared
writeable=Yes
create mask=0777
directory mask=0777
public=no
# Updating and Upgrading Raspberry Pi OS
https://www.raspberrypi.com/documentation/computers/os.html
# SSD Setup
https://www.amazon.com/Argon-Raspberry-Support-B-Key-Compatible/dp/B08MJ3CSW7?ref_=ast_sto_dp

https://www.amazon.com/Western-Digital-SA510-Internal-Solid/dp/B09ZYNHPW2/ref=sr_1_4?crid=1CXQOR68S8FVA&keywords=2280+M.2+sata+ssd&qid=1687668924&sprefix=2280+m.2+sata+ssd%2Caps%2C99&sr=8-4&ufe=app_do%3Aamzn1.fos.18ed3cb5-28d5-4975-8bc7-93deae8f9840

# Links
https://all3dp.com/2/raspberry-pi-4-firmware-update-tutorial/
https://www.raspberrypi.com/documentation/computers/raspberry-pi.html
https://linuxhint.com/raspberry-pi-sd-card-speed-test/

# How to boot Raspberry Pi 4 from USB SSD
https://sleeplessbeastie.eu/2022/12/16/how-to-boot-raspberry-pi-4-from-usb-ssd/

sudo apt update
sudo apt full-upgrade
sudo rpi-update 
sudo reboot
sudo rpi-eeprom-update
sudo rpi-eeprom-update -a -d
sudo reboot
sudo rpi-eeprom-update

# How to Test Speed of Raspberry Pi SD Card
https://linuxhint.com/raspberry-pi-sd-card-speed-test/
dd if=/dev/zero of=./speedTestFile bs=20M count=5 oflag=direct

SDCARD
104857600 bytes (105 MB, 100 MiB) copied, 4.30638 s, 24.3 MB/s

SSD
104857600 bytes (105 MB, 100 MiB) copied, 0.423376 s, 248 MB/s

https://forums.raspberrypi.com/viewtopic.php?t=31925
dd if=/dev/zero of=~/test.tmp bs=500K count=1024
dd if=~/test.tmp of=/dev/null bs=500K count=1024

# Raspberry Pi 4 xrdp windows 10 remote desktop blue screen after login FIX
https://www.reddit.com/r/raspberry_pi/comments/qw1cdw/raspberry_pi_4_xrdp_windows_10_remote_desktop/

The Pi root user cannot RDP for whatever reason.

1. `sudo adduser <username>`.
2. Choose password
3. Confirm password
4. Enter for defaults

# Connect to your Raspberry Pi Remotely
https://www.elluminetpress.com/2020/03/12/connect-to-your-raspberry-pi-remotely/

# HOW TO ACCESS THE RASPBERRY PI DESKTOP WITH A REMOTE DESKTOP CONNECTION
https://www.circuitbasics.com/access-raspberry-pi-desktop-remote-connection/

# How do I turn off my Raspberry Pi?
sudo halt -p