If **Azure Files** is blocked due to your ISP or firewall, **Azure Blob Storage** with **BlobFuse** might be a better alternative. **BlobFuse** allows you to mount Azure Blob Storage as a filesystem on Linux.

---

## **Using Azure Blob Storage with BlobFuse on Ubuntu**
### **1. Create an Azure Blob Storage Container**
1. **Go to the Azure Portal** → **Storage Account**.
2. **Select “Containers”** and click **+ Container**.
3. **Enter a name** (e.g., `homeserver-blob`).
4. Set **Public access level** to **Private** (default).
5. Click **Create**.

---

### **2. Install and Configure BlobFuse on Ubuntu**
#### **Step 1: Install BlobFuse**
```bash
sudo apt update
sudo apt install blobfuse2 -y
```

#### **Step 2: Create a Mount Directory**
```bash
sudo mkdir -p /mnt/azureblob
sudo chown $USER:$USER /mnt/azureblob
```

#### **Step 3: Create a Configuration File**
1. Create a config file directory:
   ```bash
   mkdir -p ~/.blobfuse2
   ```

2. Create a config file:
   ```bash
   nano ~/.blobfuse2/blobfuse_config.yaml
   ```

3. Add the following details:
   ```yaml
   allow-other: true
   logging:
     type: syslog
     level: log_warning
   attr_cache:
     timeout-sec: 120
   azstorage:
     type: block
     account-name: yourstorageaccount
     account-key: yourstorageaccountkey
     container: homeserver-blob
   ```

   - **Replace `yourstorageaccount`** with your Azure Storage account name.
   - **Replace `yourstorageaccountkey`** with your Azure Storage account key.
   - **Set `container: homeserver-blob`** to the container you created.

---

### **3. Mount Azure Blob Storage**
Run the following command to mount the Blob Storage:

```bash
blobfuse2 mount /mnt/azureblob --config-file ~/.blobfuse2/blobfuse_config.yaml
```

Verify the mount:
```bash
ls /mnt/azureblob
```

---

### **4. Make the Mount Persistent**
To remount the blob storage after reboot, add the following to **/etc/fstab**:
```bash
@reboot blobfuse2 mount /mnt/azureblob --config-file ~/.blobfuse2/blobfuse_config.yaml
```

Then apply:
```bash
sudo crontab -e
```
Add:
```bash
@reboot blobfuse2 mount /mnt/azureblob --config-file /home/youruser/.blobfuse2/blobfuse_config.yaml
```

---

## **5. Testing the Storage**
To upload files:
```bash
cp /path/to/file.txt /mnt/azureblob/
```

To list files:
```bash
ls -l /mnt/azureblob
```

To unmount:
```bash
fusermount -u /mnt/azureblob
```

---

## **6. Choosing Storage Tier (Hot vs. Cool)**
For general storage:
- **Hot**: If you access files frequently (~5x per day).
- **Cool**: If files are rarely accessed (~1-2x per week).
- **Archive**: If files are **only for backup** and accessed rarely.

### **Recommended:**
- **Use Cool Tier** to save costs unless you need **low latency access**.

---

## **Final Thoughts**
Since **Azure Files doesn't work with your ISP/firewall**, using **Azure Blob Storage with BlobFuse** is the best alternative. This method allows you to mount **Azure Blob Storage like a filesystem** on Ubuntu while keeping **costs low**. 🚀

Let me know if you need help troubleshooting! 💡