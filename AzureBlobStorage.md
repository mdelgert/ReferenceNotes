# How to mount Azure Blob Storage to your local Windows or virtual Linux machines (even with disabled NFS!)
https://medium.com/data-science-at-microsoft/how-to-mount-azure-blob-storage-to-your-local-windows-or-virtual-linux-machines-even-with-disabled-3008aeec3da8
https://rclone.org/azureblob/
https://unlimited.ethz.ch/display/itkb/Mount+an+Azure+blob+storage+on+Windows+using+rclone

# Links
https://github.com/rclone/rclone
https://github.com/winfsp/winfsp

# Find the necessary Blob Storage information
1. On the left navigation bar, find "Security + networking" → "Access keys" → "key1"
2. Container Name, use the container name on your local machine which you would like to mount the Blob Storage to.

# Install the client
```ps
winget install WinFsp.WinFsp
winget install Rclone.Rclone
rclone config
```

# Setup
1. select n new remote
2. storage                  33 (Microsoft Azure Blob Storage)
3. account                  copy your account name MyAccount
3. env_auth                 press enter default
5. key                      copy your account key StorageAccessKey "Security + networking" → "Access keys" → "key1"
6. others                   press enter for all others then q to quit config

# Verify storage
```ps
rclone ls yourstoragename:yourcontainer
```

# Mount as folder readonly
rclone mount storagename:containername C:\yourcontainer

# Mount as folder readwrite
rclone mount storagename:containername C:\yourcontainer --vfs-cache-mode writes

# Mount as network drive readwrite
rclone mount storagename:containername X: --vfs-cache-mode writes 

# To delete a large cached file in Rclone that is stuck trying to sync, you can manually delete the cache file from your system. 
taskkill /IM rclone.exe /F (windows)
killall rclone (linux)

C:\Users\<YourUsername>\AppData\Local\rclone\vfs\<remote_name>\<container_name> (windows)
/home/<YourUsername>/.cache/rclone/vfs/<remote_name>/<container_name> (linux)

C:\Users\<YourUsername>\AppData\Local\rclone\vfsMeta\<remote_name>\<container_name> (windows)
/home/<YourUsername>/.cache/rclone/vfsMeta/<remote_name>/<container_name> (linux)

# Get rclone config file path
```ps
rclone config file
```

C:\Users\YourUser\AppData\Roaming\rclone\rclone.conf

# GUI Links
https://github.com/hwittenborn/celeste (cloud sync)
https://github.com/kapitainsky/RcloneBrowser?tab=readme-ov-file

# Install GUI
```ps
winget install kapitainsky.RcloneBrowser
```