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