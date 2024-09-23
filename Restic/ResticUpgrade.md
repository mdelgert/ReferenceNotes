### Restic upgrade

AMD64
```bash
sudo su
restic version
which restic
apt remove restic
wget https://github.com/restic/restic/releases/download/v0.17.1/restic_0.17.1_linux_amd64.bz2
wget https://github.com/restic/restic/releases/download/v0.17.1/restic_0.17.1_linux_arm64.bz2 #RPI
bzip2 -d restic_0.17.1_linux_amd64.bz2
chmod +x restic_0.17.1_linux_amd64
mv restic_0.17.1_linux_amd64 /usr/bin/restic
```

ARM64
```bash
sudo su
restic version
which restic
apt remove restic
wget https://github.com/restic/restic/releases/download/v0.17.1/restic_0.17.1_linux_arm64.bz2
bzip2 -d restic_0.17.1_linux_arm64.bz2
chmod +x restic_0.17.1_linux_arm64
mv restic_0.17.1_linux_arm64 /usr/bin/restic
```