# Setup
https://rclone.org/install/
https://github.com/rclone/rclone

# Install rclone and gui from apt
```bash
sudo apt-get install rclone rclone-browser
```

# Setup
```bash
rclone config
```

# Mount
```bash
sudo mkdir -p /mnt/backup1
sudo chown mdelgert:mdelgert /mnt/backup1
rclone ls melgertstorage1:backup1
rclone mount melgertstorage1:backup1 /mnt/backup1 --vfs-cache-mode writes
```

rclone mount rclonestorage1:rclonebackup1 /mnt/rclonestorage1 --vfs-cache-mode writes

# Install from site
```bash
sudo -v ; curl https://rclone.org/install.sh | sudo bash
```