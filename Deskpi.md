https://github.com/DeskPi-Team/deskpi

# For Raspbian and RetroPie OS.
cd ~
git clone https://github.com/DeskPi-Team/deskpi.git
cd ~/deskpi/
chmod +x install.sh
sudo ./install.sh

# How to control fan speed mannualy.
deskpi-config

# Mount drive
https://pimylifeup.com/raspberry-pi-mount-usb-drive/
https://thepihut.com/blogs/raspberry-pi-tutorials/how-to-mount-an-external-hard-drive-on-the-raspberry-pi-raspian
https://raspberrypi-guide.github.io/filesharing/mounting-external-drive

df -h

blkid

/dev/sda1: LABEL="data" UUID="30112822-d092-4b90-a8aa-afa3e17016ff" BLOCK_SIZE="4096" TYPE="ext4" PARTLABEL="ssd" PARTUUID="1a7e0e92-5538-4950-9701-b264bd50286b"

mkdir -p /mnt/data

nano /etc/fstab

UUID=30112822-d092-4b90-a8aa-afa3e17016ff /mnt/data ext4 defaults,auto,users,rw,nofail,noatime 0 0

umount /dev/sda1

mount -a

chown -R user:user /mnt/data
