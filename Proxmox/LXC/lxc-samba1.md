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

### Mount host disk in lxc (run from host)
```bash
adduser mdelgert
id mdelgert
pct exec <container-id> -- adduser --uid 1000 --gid 1000 mdelgert #Create the user inside the LXC container with the same UID and GID (if the user doesn't already exist in the container):
mkdir /mnt/test
#chown -R mdelgert:mdelgert /mnt/test
chown -R 101000:101000 /mnt/test
chmod -R 755 /mnt/test
pct stop <container-id>
cd /etc/pve/lxc
nano <container-id>.conf #add the following
#mp0: /mnt/test,mp=/mnt/test
pct enter <container-id>
id mdelgert #verify user id matches
```

### Why This Works
To mount a host directory into an unprivileged LXC container on Proxmox (like in your case with `/mnt/test`), the simplest and most straightforward method is to adjust the UID/GID mapping to ensure the container user has the correct permissions.

### Here's a step-by-step process:

#### 1. **Stop the container**:
   ```bash
   pct stop 106
   ```

#### 2. **Adjust Ownership on the Host**:
   By default, an unprivileged LXC container maps the container’s `UID 1000` (for user `mdelgert`) to the host’s `UID 101000`. You need to change the ownership of the host directory `/mnt/test` to match this mapping:
   ```bash
   chown -R 101000:101000 /mnt/test
   ```

#### 3. **Modify the LXC Configuration**:
   Edit the container's configuration file at `/etc/pve/lxc/106.conf` and add the mount point:
   ```bash
   mp0: /mnt/test,mp=/mnt/test
   ```

#### 4. **Start the container**:
   ```bash
   pct start 106
   ```

#### 5. **Test Write Access**:
   Enter the container and test if the user `mdelgert` can now write to `/mnt/test`:
   ```bash
   pct enter 106
   su mdelgert
   touch /mnt/test/testfile.txt
   ```

### Why This Works:
- **UID/GID Mapping**: The unprivileged container remaps UIDs and GIDs starting from `100000`. For example, `UID 1000` inside the container becomes `UID 101000` on the host. By adjusting the ownership of the mounted directory to `101000`, you're ensuring that the user inside the container can write to it.
  
This method avoids the need for `shiftfs`, which isn't supported in your current setup, and doesn't require complex remapping configurations.

If you need further customization or encounter additional permission issues, you may also look into configuring custom UID/GID mappings, but this basic method should solve the issue in most common cases【19†source】【20†source】【21†source】.