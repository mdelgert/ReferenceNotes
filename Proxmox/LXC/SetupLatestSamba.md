https://github.com/christgau/wsdd

###
```bash
pct list
pct start <container_id>
pct enter <container_id>
apt update
apt install samba wsdd 
#libnss-mdns #works without but keeping it
cp /etc/samba/smb.conf /etc/samba/smb.conf.bak
truncate -s 0 /etc/samba/smb.conf #clear everything use example smb.conf
nano /etc/samba/smb.conf #see smb.conf as example
# Create directory to share
su mdelgert
cd ~
mkdir shared
exit
smbpasswd -a mdelgert
systemctl start smbd #or systemctl restart smb
systemctl enable smbd
# Latest wsdd did not download wsdd.service manually pulling from github
cd /etc/systemd/system/
wget https://raw.githubusercontent.com/christgau/wsdd/refs/heads/master/etc/systemd/wsdd.service
systemctl start wsdd #enable windows network browser
systemctl enable wsdd
wsdd --version
samba --version
smbstatus #to see status
tail -f /var/log/samba/log.smbd #to debug and see samba log
```
