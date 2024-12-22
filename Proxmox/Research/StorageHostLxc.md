To pass host storage (like directories or entire drives) to an LXC container in Proxmox, you can use bind mounts. Here's how you can configure host storage for an LXC container:

### Steps to Pass Host Storage to an LXC Container

1. **Prepare the Host Storage Directory**:
   - On the Proxmox host, decide which directory or storage path you want to pass into the LXC container.
   - Ensure the directory or drive you want to share is mounted on the host and has the correct permissions. For example, you might want to share `/mnt/storage`.

2. **Edit the LXC Container Configuration**:
   - Access the Proxmox server via SSH or directly.
   - Navigate to the container configuration file, which is usually located in `/etc/pve/lxc/`. The file will be named after the container ID (e.g., `101.conf`).
   - Open the container's configuration file using a text editor. For example:
     ```bash
     nano /etc/pve/lxc/101.conf
     ```

3. **Add the Bind Mount Entry**:
   - To bind mount a directory from the host to the LXC container, add the following line to the configuration file:
     ```
     mp0: /mnt/storage,mp=/mnt/storage
     ```
     - `mp0` specifies the mount point index. If you add more mounts later, you would increment the number (e.g., `mp1`, `mp2`).
     - `/mnt/storage` is the path on the Proxmox host.
     - `mp=/mnt/storage` is the path inside the LXC container where the storage will appear.

4. **Set Permissions**:
   - Ensure the permissions of the host directory match what you want the container to have. You can use `chown` and `chmod` commands on the host to set the correct user/group and permissions for the shared folder.

5. **Restart the LXC Container**:
   - After adding the mount point to the configuration file, restart the container for the changes to take effect:
     ```bash
     pct stop 101
     pct start 101
     ```
     Replace `101` with your container's ID.

6. **Verify the Mount in the LXC Container**:
   - Log in to the LXC container using `pct enter 101` or via SSH.
   - Once inside the container, navigate to the mount point you specified (e.g., `/mnt/storage`) and verify that the host storage is accessible.

### Optional: Mount Specific Partitions or Drives
If you want to mount a specific drive or partition rather than just a directory, you can follow the same steps, but make sure the drive is mounted on the host first (e.g., `/dev/sdb1` to `/mnt/storage`).

---

This method is efficient for sharing large storage or specific directories from your Proxmox host to LXC containers, giving the container access to the host's file system while keeping the overall system isolated.