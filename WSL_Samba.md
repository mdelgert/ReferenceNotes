https://statath.github.io/blog/how-to-mount-smb-shares-in-wsl-for-debian-based/
https://stackoverflow.com/questions/45244306/mounting-a-windows-share-in-windows-subsystem-for-linux
https://dev.to/rpalo/mounting-network-drives-into-windows-subsystem-linux-3ef7

```ps
wsl --terminate Ubuntu1
```

### Manual mount
```bash
sudo mkdir /mnt/d1
sudo mount -t drvfs '\\b1\d1\' /mnt/d1
cd /mnt/d1
sudo umount /mnt/d1
```

### Auto mount
```bash
sudo nano /etc/fstab
//b1/d1 /mnt/d1 cifs username=your_username,password=your_password 0 0
sudo mount -a
```
