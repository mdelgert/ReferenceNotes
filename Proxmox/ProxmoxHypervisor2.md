# Setup disk

```bash
lsblk
fdisk /dev/nvme1n1 #type n enter accept all default and w to write
mkfs.ext4 /dev/nvme1n1 # For ext4 file system
mkdir /mnt/d1
mount /dev/nvme1n1 /mnt/d1
df -h
blkid /dev/nvme1n1
nano /etc/fstab
```

# Example /etc/fstab
UUID=3fd2ff28-fe8d-4fc6-ae9d-c631f275f190 /mnt/d1 ext4 defaults 0 0

# Setup USB
```bash
lsblk
fdisk /dev/sda #type n enter accept all default and w to write
mkfs.ext4 /dev/sda # For ext4 file system
mkdir /mnt/usb1
mount /dev/sda /mnt/usb1
df -h
blkid /dev/sda
nano /etc/fstab
```

# Example /etc/fstab with no fail
UUID=325ca13d-2678-44e7-97ef-c12f98428aa6 /mnt/d2 auto nosuid,nodev,nofail 0 0

# Reload /etc/fstab and Mount All Filesystems:
```bash
mount -a
```

# Steps to Share a Directory Using 9p
https://chatgpt.com/share/645413b7-18a7-42e8-a7cf-4d2830628b78
```bash
apt-get install virtiofsd
nano /etc/pve/qemu-server/100.conf
mkdir -p /mnt/hostshare/d1
mount -t 9p -o trans=virtio,version=9p2000.L hostshare /mnt/hostshare/d1
df -h
```

# Example /etc/pve/qemu-server/100.conf
args: -fsdev local,security_model=passthrough,id=fsdev0,path=/mnt/d1 -device virtio-9p-pci,fsdev=fsdev0,mount_tag=hostshare

# Example /etc/fstab
hostshare /mnt/hostshare/d1 9p trans=virtio,version=9p2000.L,rw 0 0

