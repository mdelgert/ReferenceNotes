# From proxmox console enter lxc
```bash
pct list
pct enter id
```

# Update locals
```bash
locale -a
sudo locale-gen en_US.UTF-8
sudo dpkg-reconfigure locales # select en_US.UTF-8
```

# Add the following to /etc/default/locale
```bash
sudo nano /etc/default/locale 
#Add the following lines
LANG="en_US.UTF-8"
LANGUAGE="en_US:en"
LC_ALL="en_US.UTF-8"
sudo reboot
locale -a # check local after reboot
```

# Update
```bash
apt update && apt upgrade -y
apt autoremove -y
apt clean
```

# Add user
```bash
sudo adduser <username>
sudo usermod -aG sudo <username>
sudo visudo 
#add the following 
#<username> ALL=(ALL) NOPASSWD:ALL
su <username>
sudo whoami
cd ~
mkdir .ssh
cd .ssh
touch authorized_keys
nano authorized_keys
```

### Name resolution 
```bash
apt install avahi-daemon # Enable to allow network name resolution
systemctl enable avahi-daemon
systemctl start avahi-daemon
```

### Auto login pve terminal
```bash
pct enter id
systemctl edit container-getty@.service
reboot # To confirm its working
```

# Add the following above (Edits below this comment will be discarded)
[Service]
ExecStart=
ExecStart=-/sbin/agetty --autologin root --noclear --keep-baud tty%I 115200,38400,9600 $TERM

# Export lxc template
```bash
pct list
pct fsck 100 # (Optional) Check filesystem
vzdump 102 --dumpdir /var/lib/vz/template/cache --compress zstd
cd /var/lib/vz/template/cache
rm dumpfile.log
mv dumpfile.tar.zst example.tar.zst
```