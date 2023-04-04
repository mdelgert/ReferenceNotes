# Filesharing with the Raspberry Pi
https://raspberrypi-guide.github.io/filesharing/filesharing-raspberry-pi#:~:text=The%20simplest%20way%20to%20share,%3A%20.
https://behind-the-scenes.net/sharing-a-raspberry-pi-directory-on-a-local-area-network/

sudo apt install samba samba-common-bin

sudo chmod -R 777 /mnt/data

sudo cp -p /etc/samba/smb.conf /etc/samba/smb.conf.original

sudo nano /etc/samba/smb.conf

[pishare]
path = /mnt/data
writeable = yes
browseable = yes
create mask = 0777
directory mask = 0777
public = no

sudo smbpasswd -a user

sudo systemctl restart smbd