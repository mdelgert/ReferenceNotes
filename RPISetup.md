# TRIM SETUP
https://www.jeffgeerling.com/blog/2020/enabling-trim-on-external-ssd-on-raspberry-pi
sudo nano /etc/udev/rules.d/10-trim.rules
ACTION=="add|change", ATTRS{idVendor}=="174c", ATTRS{idProduct}=="55aa", SUBSYSTEM=="scsi_disk", ATTR{provisioning_mode}="unmap"
sudo systemctl enable fstrim.timer
fstrim -v /