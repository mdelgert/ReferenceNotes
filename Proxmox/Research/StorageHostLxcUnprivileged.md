Given that your container is unprivileged (`unprivileged: 1`), and you are using a bind mount (`mp0: /mnt/d1,mp=/mnt/d1`), the issue arises because the `root` user in the LXC container is mapped to a non-root UID on the Proxmox host. You need to adjust the ownership of the directory on the host to match the UID mapping of the unprivileged root user in the container.

### Step-by-Step Solution:

1. **Check the UID Mapping for Unprivileged Containers:**

   Unprivileged containers map the root user (UID `0` inside the container) to a different UID on the host, typically starting at UID `100000`. Let’s confirm this mapping in your container configuration.

   The mapping configuration is usually `lxc.idmap` in the container's config file:
   ```bash
   lxc.idmap = u 0 100000 65536
   lxc.idmap = g 0 100000 65536
   ```

   This means the root user (UID `0`) inside the container is mapped to UID `100000` on the host.

2. **Adjust Ownership of the Host Directory:**

   Since the root user inside the unprivileged container is mapped to UID `100000` on the host, you need to change the ownership of the `/mnt/d1` directory on the host to match this UID and GID.

   Run this command on the **Proxmox host**:
   ```bash
   chown 100000:100000 /mnt/d1
   ```

3. **Set the Correct Permissions:**

   After adjusting the ownership, set appropriate permissions to allow read, write, and execute access for the container’s root user.

   For example, to allow full access for the root user inside the container and read access for others:
   ```bash
   chmod 755 /mnt/d1
   ```

4. **Restart the LXC Container:**

   After adjusting the ownership and permissions, restart the container:
   ```bash
   pct stop 104
   pct start 104
   ```

5. **Verify in the Container:**

   Log back into the container and check if you can now write to the directory:
   ```bash
   pct enter 104
   touch /mnt/d1/test.txt
   ```

This should resolve the `Permission denied` issue when trying to write to the bind-mounted directory in the unprivileged container.

### Recap:
- **Root inside the unprivileged container is mapped to UID `100000` on the host.**
- **Change the ownership of `/mnt/d1` to UID `100000` on the host.**
- **Adjust the permissions on `/mnt/d1` to allow access for this UID.**

