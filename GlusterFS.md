### Links
https://www.youtube.com/watch?v=Has6lUPdzzY&list=PLC5hLl1wqo43IaUc0MDti5uoymdKWAwDk&index=2&t=600s
https://www.gluster.org/install/
https://bookstack.elzim.xyz/books/self-hosting/page/glusterfs-setup
https://docs.gluster.org/en/v3/Administrator%20Guide/Setting%20Up%20Volumes/
https://nickhowell.uk/2016/07/23/raspberry-pi-nas-with-gluster/

### gluster volume create [stripe | replica | disperse] [transport tcp | rdma | tcp,rdma]
```bash
sudo apt install glusterfs-server -y
sudo systemctl start glusterd
sudo systemctl enable glusterd
sudo su
gluster peer probe p2; gluster peer probe p3; gluster peer probe p4;
sudo gluster pool list
sudo mkdir -p /gluster/volumes
sudo gluster volume create staging-gfs replica 3 p2:/gluster/volumes p3:/gluster/volumes p4:/gluster/volumes force
sudo mkdir /mnt/staging-gfs
sudo nano /etc/fstab
localhost:/staging-gfs /mnt/staging-gfs glusterfs defaults,_netdev,backupvolfile-server=localhost 0 0
sudo mount.glusterfs localhost:/staging-gfs /mnt/staging-gfs
sudo chown mdelgert:mdelgert /mnt/staging-gfs
sudo gluster volume start staging-gfs
```

### Remove gluster fs
```bash
sudo su
gluster volume status staging-gfs
umount /mnt/staging-gfs
gluster volume stop staging-gfs
gluster volume delete staging-gfs
systemctl restart glusterd
apt-get remove --purge glusterfs-server -y
```

### Creating Distributed Replicated Volumes all machines
```bash
sudo mkdir /gluster
sudo mkdir /mnt/gfs
sudo chown mdelgert:mdelgert /mnt/gfs
```

### Creating Distributed Replicated Volumes Master server only
```bash
sudo gluster volume create gfs replica 2 transport tcp p1:/gluster/volumes p2:/gluster/volumes p3:/gluster/volumes p4:/gluster/volumes force
sudo gluster volume start gfs
gluster volume status gfs
sudo mount.glusterfs localhost:/gfs /mnt/gfs
```

### Auto mount the cluster
```bash
sudo nano /etc/fstab
localhost:/gfs /mnt/gfs glusterfs defaults,_netdev,backupvolfile-server=localhost 0 0
```


########### NOT WORKING #########################################

### How to mount a local GlusterFS volume at boot (fstab/systemd fix) 
https://hub.docker.com/r/trajano/glusterfs-volume-plugin/
https://forums.docker.com/t/share-glusterfs-mount-in-one-container-to-other-container/48175/4
https://bugs.launchpad.net/ubuntu/+source/glusterfs/+bug/876648
https://stanislas.blog/2018/10/how-to-mount-local-glusterfs-volume-boot-fstab-systemd-fix/

```bash
sudo nano /etc/fstab
localhost:/gfs /mnt/gfs glusterfs defaults,_netdev 0 0
```

```bash
sudo nano /etc/systemd/system/gfs.mount
```

### Then add the following to the file
[Unit]
Description=Mount GlusterFS Volume
After=glusterfs-server.service
Wants=glusterfs-server.service

### After adding the file reload
```bash
sudo systemctl daemon-reload
sudo systemctl enable gfs.mount
sudo systemctl start gfs.mount
sudo systemctl disable gfs.mount
sudo systemctl daemon-reload
sudo rm /etc/systemd/system/gfs.mount
```





