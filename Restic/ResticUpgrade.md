```bash
sudo su
restic version
which restic
apt remove restic
wget https://github.com/restic/restic/releases/download/v0.17.1/restic_0.17.1_linux_amd64.bz2
bzip2 -d restic_0.17.1_linux_amd64.bz2
chmod +x restic_0.17.1_linux_amd64
mv restic_0.17.1_linux_amd64 /usr/bin/restic
```
