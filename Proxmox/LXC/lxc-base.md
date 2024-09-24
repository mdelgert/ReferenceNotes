### lxc-d1 setup
template debian-12-standard_12.7-1_amd64.tar.zst

### Packages 
```bash
apt update && apt upgrade -y
apt autoremove -y
apt clean
```

### Name resolution 
```bash
apt install avahi-daemon # Enable to allow network name resolution
systemctl enable avahi-daemon
systemctl start avahi-daemon
```

### Auto login terminal
```bash
systemctl edit container-getty@.service
```

Add the following

[Service]
ExecStart=
ExecStart=-/sbin/agetty --autologin root --noclear --keep-baud tty%I 115200,38400,9600 $TERM

# Update locals
```bash
dpkg-reconfigure locales #select en_US.UTF-8 also set as default locale
nano /etc/default/locale #add the following example
locale-gen en_US.UTF-8 #regenerate the locale
update-locale LANG=en_US.UTF-8
reboot #apply the locals
```

LANG=en_US.UTF-8
LANGUAGE=en_US:en
LC_ALL=en_US.UTF-8

# Export lxc template
```bash
pct list
pct stop <container_id>
vzdump <container_id> --dumpdir /var/lib/vz/template/cache --compress zstd
cd /var/lib/vz/template/cache
rm dumpfile.log
mv dumpfile.tar.zst example.tar.zst
```