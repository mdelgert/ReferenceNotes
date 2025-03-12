Here’s a comprehensive **README.md** for setting up and using `blobfuse2` on Linux. This markdown includes installation, configuration, usage examples, troubleshooting, and performance tips.

---

# 📦 Blobfuse2 - Mount Azure Blob Storage as a Filesystem on Linux

**Blobfuse2** is a virtual file system driver for Linux that allows you to mount Azure Blob Storage containers as a local file system.

---

## ✅ **1. Installation**

### **Ubuntu/Debian**
```bash
sudo apt update
sudo apt install blobfuse2
```

### **Red Hat/CentOS/Fedora**
```bash
sudo yum install blobfuse2
```

### **Alternatively, Install from Source**
```bash
git clone https://github.com/Azure/azure-storage-fuse.git
cd azure-storage-fuse
mkdir build
cd build
cmake ..
make
sudo make install
```

---

## 🗂️ **2. Configuration**

### **Create a Configuration File**
Create a YAML configuration file at `/etc/blobfuse2/config.yaml` with the following content:

```yaml
azstorage:
  type: "block"                         # Storage type: block (Blob Storage)
  account-name: "<your-storage-account-name>" 
  container: "<your-container-name>" 
  account-key: "<your-storage-account-key>"  # Or use a SAS token for more security
  auth-type: "access-key"               # Use "access-key" or "sas-token" as needed

file_cache:
  path: "/mnt/blobfuse/cache"           # Local cache directory
  timeout-sec: 120
  max-size-mb: 2048

logging:
  type: syslog
  level: log_debug                      # Options: log_off, log_error, log_warning, log_info, log_debug

attr_cache:
  timeout-sec: 120
```

### **Set Correct Permissions**
```bash
sudo chmod 600 /etc/blobfuse2/config.yaml
```

---

## 📁 **3. Mount Azure Blob Storage**

### **Create Mount and Cache Directories**
```bash
sudo mkdir -p /mnt/azure
sudo mkdir -p /mnt/blobfuse/cache
sudo chown $(whoami) /mnt/azure /mnt/blobfuse/cache
```

### **Mount Using Blobfuse2**
```bash
blobfuse2 mount /mnt/azure --config-file=/etc/blobfuse2/config.yaml
```

---

## 💾 **4. Persistent Mount (Systemd Service)**

Create a systemd service file at `/etc/systemd/system/blobfuse2.service`:

```ini
[Unit]
Description=Mount Azure Blob Storage using blobfuse2
After=network-online.target

[Service]
ExecStart=/usr/bin/blobfuse2 mount /mnt/azure --config-file=/etc/blobfuse2/config.yaml
Restart=always
User=root
Environment=AZURE_STORAGE_ACCOUNT=<your-storage-account-name>
Environment=AZURE_STORAGE_KEY=<your-storage-account-key>

[Install]
WantedBy=multi-user.target
```

Enable and start the service:
```bash
sudo systemctl enable blobfuse2
sudo systemctl start blobfuse2
sudo systemctl status blobfuse2
```

---

## ⚙️ **5. Usage Examples**

### **List Files**
```bash
ls /mnt/azure
```

### **Copy Files**
```bash
cp /mnt/azure/myfile.txt ~/Downloads
```

### **Write Files**
```bash
echo "Hello Blob Storage!" > /mnt/azure/hello.txt
```

### **Unmount**
```bash
sudo umount /mnt/azure
```

---

## 🔒 **6. Authentication Options**

- **Access Key**: Use `account-key` in the config file (less secure).
- **SAS Token**: Use `sas-token` in the config file for more security.
- **Azure Identity**: Use `msi` or `service-principal` for enterprise use.

---

## 🚀 **7. Performance Tips**

- Use `--use-attr-cache` to reduce API calls and improve performance.
- Adjust `max-size-mb` in the cache configuration based on available disk space.
- Enable read-ahead buffering using:
  ```yaml
  stream_cache:
    enable: true
    max-size-mb: 512
  ```

---

## 🧩 **8. Troubleshooting**

### **1. Permission Denied**
Ensure you have ownership of the mount and cache directories:
```bash
sudo chown $(whoami) /mnt/azure /mnt/blobfuse/cache
```

### **2. Mount Fails**
Check logs using:
```bash
journalctl -u blobfuse2
```
Or check syslog:
```bash
sudo tail -f /var/log/syslog
```

### **3. Cache Directory Error**
Ensure the cache directory exists and has proper permissions:
```bash
sudo mkdir -p /mnt/blobfuse/cache
sudo chmod 777 /mnt/blobfuse/cache
```

---

## 📜 **9. Uninstall Blobfuse2**

To remove Blobfuse2, use:
```bash
sudo apt remove blobfuse2   # For Ubuntu/Debian
sudo yum remove blobfuse2   # For Red Hat/CentOS
```

---

## 📚 **10. Documentation and Resources**

- [Official Blobfuse2 GitHub Repository](https://github.com/Azure/azure-storage-fuse)
- [Azure Blob Storage Documentation](https://learn.microsoft.com/en-us/azure/storage/blobs/)
- [Blobfuse2 Configuration Guide](https://learn.microsoft.com/en-us/azure/storage/blobs/blobfuse2-how-to-configure)

---

### ✅ **Conclusion**
Using **Blobfuse2** allows seamless integration of Azure Blob Storage with Linux systems, enabling cloud-native workflows without modifying existing applications.

---

Would you like this README as a downloadable file? 📥

The error occurs because the `blobfuse2` process, running as your non-root user (`mdelgert`), cannot read the `config.yaml` file, which is owned by `root` and has permissions set to `600` (read/write only for root).

Here are two ways to resolve this issue:

---

### ✅ **Option 1: Change Ownership to Your User** (Recommended)
If you plan to run `blobfuse2` as your user (`mdelgert`), grant yourself ownership of the config file:
```bash
sudo chown mdelgert /etc/blobfuse2/config.yaml
```
This allows your user to read the file while keeping permissions secure.

---

### 🧩 **Option 2: Run Blobfuse2 as Root**
If changing ownership is not desirable, run `blobfuse2` as root:
```bash
sudo blobfuse2 mount /mnt/azure --config-file=/etc/blobfuse2/config.yaml
```
This works because root can access the file regardless of permissions.

---

### ⚙️ **Best Practice for Systemd Service**
If using **systemd** for persistent mounts, specify the user in `/etc/systemd/system/blobfuse2.service`:
```ini
[Service]
User=mdelgert
ExecStart=/usr/bin/blobfuse2 mount /mnt/azure --config-file=/etc/blobfuse2/config.yaml
```
Then reload and restart:
```bash
sudo systemctl daemon-reload
sudo systemctl restart blobfuse2
```

---

Now you should be able to mount Azure Blob Storage without any permission issues. ✅