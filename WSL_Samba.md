
https://statath.github.io/blog/how-to-mount-smb-shares-in-wsl-for-debian-based/
https://stackoverflow.com/questions/45244306/mounting-a-windows-share-in-windows-subsystem-for-linux
https://dev.to/rpalo/mounting-network-drives-into-windows-subsystem-linux-3ef7

```ps
wsl --terminate Ubuntu1
```

### Manual mount
```bash
sudo apt install cifs-utils
sudo mkdir /mnt/d1
sudo mount -t drvfs '\\b1\d1\' /mnt/d1
cd /mnt/d1
sudo umount /mnt/d1
```

### Mount cifs Network Drive: write permissions and chown
https://unix.stackexchange.com/questions/68079/mount-cifs-network-drive-write-permissions-and-chown
```bash
#sudo mount -t cifs -o username=${USER},password=${PASSWORD} //server-address/folder /mount/path/on/ubuntu
#sudo mount -t cifs -o username=${USER},password=${PASSWORD} //b1/d1 /mnt/d1
#sudo mount -t cifs -o username=${USER},password=${PASSWORD},uid=$(id -u),gid=$(id -g) //server-address/folder /mount/path/on/ubuntu
#/192.168.0.5/storage /media/myname/TK-Public/ cifs guest,uid=myuser,iocharset=utf8,file_mode=0777,dir_mode=0777,noperm 0 0
```

### Auto mount does not work
```bash
#sudo nano /etc/fstab
#//b1/d1 /mnt/d1 cifs credentials=/home/mdelgert/.smbcredentials uid=1000 gid=1000 file_mode=0664 dir_mode=0775 _netdev 0 0
#//b1/d1 /mnt/d1 cifs credentials=/home/mdelgert/.smbcredentials,uid=1000,gid=1000,file_mode=0664,dir_mode=0775,_netdev 0 0
#//b1/d1 /mnt/d1 cifs credentials=/home/mdelgert/.smbcredentials rw uid=1000 gid=1000 file_mode=0664 dir_mode=0775 _netdev 0 0
#//p1/gluster /mnt/gluster cifs credentials=/home/mdelgert/.smbcredentials,uid=1000,gid=1000,file_mode=0664,dir_mode=0775 0 0
#sudo mount -a
```