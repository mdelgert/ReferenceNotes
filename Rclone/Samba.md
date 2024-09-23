
### Rclone samba share

To share your `/mnt/rclonestorage2-enc` directory (mounted via Rclone) as a Samba share, follow these steps:

### Step 1: Install Samba
If Samba is not already installed, you can install it using the following command:

```bash
sudo apt update
sudo apt install samba
```

### Step 2: Configure Samba
After Samba is installed, you need to configure it to share the Rclone-mounted directory. Open the Samba configuration file:

```bash
sudo nano /etc/samba/smb.conf
```

### Step 3: Add a New Samba Share
At the bottom of the file, add a new section for your Rclone-mounted directory. Replace `/mnt/rclonestorage2-enc` with your actual mount point, and configure the share settings to your preference.

For example, add the following:

```ini
[rclonestorage]
   path = /mnt/rclonestorage2-enc
   browseable = yes
   read only = no
   guest ok = no
   valid users = mdelgert
```

- `path`: The path to the Rclone-mounted directory.
- `browseable = yes`: This makes the share visible when browsing.
- `read only = no`: This allows writing to the share.
- `guest ok = no`: Disable guest access (you can enable it by setting this to `yes`).
- `valid users = mdelgert`: Restrict access to specific users (replace `mdelgert` with your username or group).

### Step 4: Set Samba User Password
If you haven't already added a Samba user, you need to add your Linux user as a Samba user. Run:

```bash
sudo smbpasswd -a mdelgert
```

This will set the Samba password for the user `mdelgert`.

### Step 5: Restart Samba
After making the configuration changes, restart the Samba service to apply them:

```bash
sudo systemctl restart smbd
```

### Step 6: Adjust Permissions (Optional)
Ensure that the user has the necessary permissions to access the Rclone-mounted directory. You may need to adjust ownership or permissions:

```bash
sudo chown -R mdelgert:mdelgert /mnt/rclonestorage2-enc
```

Or make it world-readable/writable (if guest access is enabled):

```bash
sudo chmod 777 /mnt/rclonestorage2-enc
```

### Step 7: Access the Samba Share
You can now access the Samba share from another computer. Use the following in a file manager or by mapping a network drive:

```
\\<server-ip>\rclonestorage
```

Replace `<server-ip>` with the IP address or hostname of your Linux server.

### Troubleshooting
- Ensure Samba is allowed through your firewall if you're running one:

  ```bash
  sudo ufw allow samba
  ```

- Check the status of Samba to ensure it's running without errors:

  ```bash
  sudo systemctl status smbd
  ```

Now your Rclone-mounted directory (`/mnt/rclonestorage2-enc`) should be accessible as a Samba share on your network!