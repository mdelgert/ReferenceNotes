To set permissions correctly for the shared storage between the Proxmox host and the LXC container, follow these steps depending on the user/group setup in the container and what kind of access you want to grant.

### 1. **Determine the Correct UID and GID**

By default, the user IDs (UID) and group IDs (GID) of users inside the LXC container may be different from the Proxmox host. For instance, the `root` user in the container may not map to the same `root` user on the host unless you use an unprivileged container. Here's how to handle permission mapping:

#### Check UID and GID inside the container:
- Enter your LXC container:
  ```bash
  pct enter <container_id>
  ```
- Run the following command to check the UID and GID of the user in the container that needs access to the shared folder:
  ```bash
  id <username>
  ```
  For example, for `root`:
  ```bash
  id root
  ```
  This will output something like:
  ```
  uid=0(root) gid=0(root) groups=0(root)
  ```
  Note the UID and GID for the user you want to give access to.

### 2. **Set Permissions on the Proxmox Host**

Once you know the UID and GID that should have access, you can apply the correct permissions to the folder on the Proxmox host.

#### Change Ownership of the Shared Folder:
Use the `chown` command on the Proxmox host to set the correct ownership. For example, if the UID and GID inside the container are both `1000` and the folder you are sharing is `/mnt/storage`, you would run:
```bash
chown 1000:1000 /mnt/storage
```
This will make sure the container user with UID `1000` has ownership of the folder.

#### Adjust Permissions:
- If you want only the owner to have full access (read, write, execute), you can set permissions like this:
  ```bash
  chmod 700 /mnt/storage
  ```
  This grants the owner full access and denies access to others.

- If you want the group to also have read/write access:
  ```bash
  chmod 770 /mnt/storage
  ```

- If you want anyone to have access (less secure):
  ```bash
  chmod 777 /mnt/storage
  ```

### 3. **Set User Mapping for Unprivileged Containers**

If you're using an unprivileged container, the UIDs and GIDs inside the container are mapped to different UIDs and GIDs on the host (typically starting from 100000). In this case, you'll need to adjust permissions based on the mapped IDs.

#### Check UID/GID Mappings:
On the Proxmox host, check the UID/GID mapping for the container in `/etc/pve/lxc/<container_id>.conf`. You'll see lines like this:
```
lxc.idmap = u 0 100000 65536
lxc.idmap = g 0 100000 65536
```
This means that the `root` user (UID 0) inside the container is mapped to UID `100000` on the host. You need to adjust the ownership of the shared folder on the Proxmox host to match this mapping. For example:
```bash
chown 100000:100000 /mnt/storage
```

### 4. **Verify Permissions in the Container**

After setting the permissions on the host, restart the container:
```bash
pct stop <container_id>
pct start <container_id>
```

Now enter the container and verify that the user has the appropriate access to the shared folder:
```bash
pct enter <container_id>
ls -l /mnt/storage
```

This should show that the user in the container has the necessary permissions for the shared folder.

### Summary
- Use `chown` to set ownership based on the container's UID and GID.
- Use `chmod` to set appropriate access permissions.
- For unprivileged containers, adjust permissions based on UID/GID mappings from the container to the host.

This approach ensures that the LXC container can properly access and manipulate the files in the shared folder according to your needs.