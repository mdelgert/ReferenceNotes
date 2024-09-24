### lxc-d1 setup
template debian-12-standard_12.7-1_amd64-base.tar.zst

```bash
pct list
pct start <container_id>
pct enter <container_id>
apt update
apt install samba avahi-daemon wsdd libnss-mdns #works without but keeping it
cp /etc/samba/smb.conf /etc/samba/smb.conf.bak
scp lxc-samba1:/etc/samba/smb.conf.bak smb.conf.bak #backup file locally
truncate -s 0 /etc/samba/smb.conf #clear everything use example smb.conf
nano /etc/samba/smb.conf
testparm #verify the config has valid values
adduser mdelgert
smbpasswd -a mdelgert
mkdir -p /mnt/test
chown mdelgert:mdelgert /mnt/test
chmod 775 /mnt/test #give mdelgert full read and write access to the folder
systemctl start smbd #or systemctl restart smb
systemctl enable smbd
systemctl start wsdd #enable windows network browser
systemctl enable wsdd
wsdd --version
samba --version
smbstatus #to see status
tail -f /var/log/samba/log.smbd #to debug and see samba log
```