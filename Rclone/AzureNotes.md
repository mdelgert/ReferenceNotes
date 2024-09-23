# Setup Mount
```bash
sudo apt install fuse3
rclone config
rclone ls rclonestorage2-enc:/
sudo mkdir -p /mnt/rclonestorage2-enc
sudo chown mdelgert /mnt/rclonestorage2-enc
sudo chmod 777 /mnt/rclonestorage2-enc
rclone mount rclonestorage2-enc:/ /mnt/rclonestorage2-enc --vfs-cache-mode writes
rclone mount rclonestorage2-enc:/ /mnt/rclonestorage2-enc --vfs-cache-mode writes & #Run in background
```

# Unmount rclone
```bash
fusermount -u /mnt/rclonestorage2-enc
```

# Allow samba fuse access
```bash
sudo nano /etc/fuse.conf
```
uncomment user_allow_other