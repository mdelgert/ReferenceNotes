# How to log into Cockpit
https://www.techrepublic.com/article/install-cockpit-ubuntu-better-server/

# Promoix LXC ubuntu cockpit install
```bash
apt update && apt full-upgrade
apt install cockpit --no-install-recommends
```

# Allow root login
```bash
nano /etc/cockpit/disallowed-users # comment out root
```

Vist servername:9090

# Setup samba
```bash
wget https://github.com/45Drives/cockpit-file-sharing/releases/download/v3.3.7/cockpit-file-sharing_3.3.7-1focal_all.deb
wget https://github.com/45Drives/cockpit-navigator/releases/download/v0.5.10/cockpit-navigator_0.5.10-1focal_all.deb
wget https://github.com/45Drives/cockpit-identities/releases/download/v0.1.12/cockpit-identities_0.1.12-1focal_all.deb
apt install ./*.deb
rm *.deb
```

# Modules
https://github.com/45Drives/cockpit-file-sharing
https://github.com/45Drives/cockpit-navigator
https://github.com/45Drives/cockpit-identities