# Filesharing with the Raspberry Pi
https://raspberrypi-guide.github.io/filesharing/filesharing-raspberry-pi#:~:text=The%20simplest%20way%20to%20share,%3A%20.
https://behind-the-scenes.net/sharing-a-raspberry-pi-directory-on-a-local-area-network/
https://github.com/seamusdemora/PiFormulae/blob/master/FileShare.md
https://mtrtech.fandom.com/wiki/Permanently_Mount_Network_Drive_with_Samba

sudo apt-get install cifs-utils

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

# add the user
sudo smbpasswd -a user

# restart the service
sudo systemctl restart smbd

# mount the share
sudo mount -t cifs -o username=<username>,password=<password>,uid=$(id -u),gid=$(id -g) //<remote_host>/<share_name> mountpoint

# unmount share
umount sharename

# mount all in fstab
sudo mount -a

# auto mount share
sudo nano /etc/fstab
//server/share /mnt/myshare cifs username=your_username,password=your_password 0 0
sudo mount -a

# https://unix.stackexchange.com/questions/68079/mount-cifs-network-drive-write-permissions-and-chown
# You are mounting the CIFS share as root (because you used sudo), so you cannot write as normal user. If your Linux Distribution and its kernel are recent enough that you could #mount the network share as a normal user (but under a folder that the user own), you will have the proper credentials to write file (e.g. mount the shared folder somewhere under your home directory, like for instance $HOME/netshare/. Obviously, you would need to create the folder before mounting it).

# An alternative is to specify the user and group ID that the mounted network share should used, this would allow that particular user and potentially group to write to the share. Add the following options to your mount: uid=<user>,gid=<group> and replace <user> and <group> respectively by your own user and default group, which you can find automatically with the id command.

# https://serverdiary.com/linux/how-to-mount-windows-shares-or-samba-on-linux-centos-and-ubuntu/
If you want to auto mount on boot, edit /etc/fstab and add the following mount command:

\\<remote_host>\storage-photo /mnt/windows cifs user,uid=1001,rw,suid,username=pion,password=my_password 0 0

\\<remote_host>\storage-photo /mnt/windows cifs credentials=/root/secret.txt,rw,_netdev,uid=1001,gid=1001 0 0