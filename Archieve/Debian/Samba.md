# Install and Configure Samba on Debian

## Step 1: Install Samba

First, update your package list and install Samba.

```sh
sudo apt update
sudo apt install samba
```

## Step 2: Configure Samba

1. **Create a backup of the original configuration file:**

   ```sh
   sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak
   ```

2. **Edit the Samba configuration file:**

   Open the configuration file in your preferred text editor, such as `nano`.

   ```sh
   sudo nano /etc/samba/smb.conf
   ```

3. **Remove or comment out the default shares:**

   Comment out the `[homes]` and `[printers]` sections by adding a `;` at the beginning of each line:

   ```sh
   ;[homes]
   ;   comment = Home Directories
   ;   browseable = no
   ;   read only = yes
   ;   create mask = 0700
   ;   directory mask = 0700
   ;   valid users = %S

   ;[printers]
   ;   comment = All Printers
   ;   browseable = no
   ;   path = /var/spool/samba
   ;   printable = yes
   ;   guest ok = no
   ;   read only = yes
   ;   create mask = 0700
   ```

4. **Add a new share for the directory `/mnt/d1`:**

   Add the following lines at the end of the file to create a new share:

   ```sh
   [d1]
       path = /mnt/d1
       browseable = yes
       writable = yes
       valid users = mdelgert
       create mask = 0660
       directory mask = 0770
   ```

## Step 3: Create the User and Set Permissions

1. **Create the user `mdelgert` if it doesn't already exist:**

   ```sh
   sudo adduser mdelgert
   ```

2. **Set a Samba password for the user `mdelgert`:**

   ```sh
   sudo smbpasswd -a mdelgert
   ```

3. **Ensure the directory exists and set the correct permissions:**

   ```sh
   sudo mkdir -p /mnt/d1
   sudo chown mdelgert:mdelgert /mnt/d1
   sudo chmod 0770 /mnt/d1
   ```

## Step 4: Restart Samba Services

Restart the Samba services to apply the changes.

```sh
sudo systemctl restart smbd
sudo systemctl restart nmbd
```

## Step 5: Verify the Configuration

Check the status of Samba to ensure it's running correctly:

```sh
sudo systemctl status smbd
sudo systemctl status nmbd
```

Additionally, you can test the Samba configuration file for errors:

```sh
testparm
```

# Make samba share visible in Windows "Network"
https://www.truenas.com/community/resources/how-to-kill-off-smb1-netbios-wins-and-still-have-windows-network-neighbourhood-better-than-ever.106/
https://askubuntu.com/questions/661611/make-samba-share-visible-in-windows-network
https://github.com/christgau/wsdd

```sh
sudo apt install wsdd
```