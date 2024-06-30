# Speeding up
https://medium.com/@leandrocrs/speeding-up-wsl-i-o-up-than-5x-fast-saving-a-lot-of-battery-life-cpu-usage-c3537dd03c74

### Register instance
```ps
wsl --unregister Ubuntu1
wsl --import Ubuntu1 C:\Data\WSL\Ubuntu1 C:\Backups\Ubuntu1.tar
wsl --set-default Ubuntu1
wsl --list
```

### Update WSL config
```bash
sudo nano /etc/wsl.conf
```

### Example wsl config
[boot]
systemd = true

[user]
default = mdelgert

### Shutdown to apply
```ps
wsl --shutdown
```

### Passwordless sudo access in WSL Ubuntu:
```bash
sudo visudo
mdelgert ALL=(ALL) NOPASSWD: ALL
```

### Install packages
```bash
sudo apt update
sudo apt upgrade
sudo apt install neofetch git python3-pip cifs-utils
```

### Update and install CIFS
```bash
sudo mkdir /mnt/d1
touch ~/.smbcredentials
nano ~/.smbcredentials
sudo nano /etc/fstab
```

### Example .smbcredentials
username=user
password=pass

### Example fstab
//b1/d1 /mnt/d1 cifs credentials=/home/mdelgert/.smbcredentials,uid=1000,gid=1000,file_mode=0664,dir_mode=0775,noauto,x-systemd.automount 0 0
//p1/gluster /mnt/gfs cifs credentials=/home/mdelgert/.smbcredentials,uid=1000,gid=1000,file_mode=0664,dir_mode=0775,noauto,x-systemd.automount 0 0


### wsl --shutdown, test if mount work and create symbolic link
```bash
cd /mnt/d1
ls
touch test
ln -s /mnt/d1 ~/shared
```

### git setup
```bash
git config --global user.name "John Doe"
git config user.name
git config --global user.email "test@test.com"
git config user.email
```

### bashrc
```
nano ~/.bashrc
```

### example bashrc
alias python='python3'

### Docker
```bash
sudo curl -fsSL https://get.docker.com | bash
sudo usermod -aG docker $USER
docker run hello-world
```