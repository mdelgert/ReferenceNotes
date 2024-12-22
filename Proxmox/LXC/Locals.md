The warning indicates that the locale settings on your system are not configured or are incomplete. To resolve this issue, follow these steps:

---

### **1. Check Installed Locales**
Run the following command to see which locales are installed on your system:
```bash
locale -a
```
Look for `en_US.UTF-8` in the output. If it is missing, you need to generate it.

---

### **2. Generate the Locale**
If `en_US.UTF-8` is not listed, generate it using the appropriate command for your Linux distribution:

#### **Ubuntu/Debian:**
```bash
sudo locale-gen en_US.UTF-8
sudo dpkg-reconfigure locales
```

#### **CentOS/RHEL/AlmaLinux/RockyLinux:**
```bash
sudo localedef -v -c -i en_US -f UTF-8 en_US.UTF-8
```

---

### **3. Update Locale Settings**
Set the default locale system-wide:

1. **Edit the `/etc/default/locale` file (Ubuntu/Debian):**
   ```bash
   sudo nano /etc/default/locale
   ```
   Add or update the following lines:
   ```plaintext
   LANG="en_US.UTF-8"
   LANGUAGE="en_US:en"
   LC_ALL="en_US.UTF-8"
   ```

2. **Export Environment Variables Temporarily:**
   For the current session, export the necessary variables:
   ```bash
   export LANG=en_US.UTF-8
   export LC_ALL=en_US.UTF-8
   ```

3. **Set Environment Variables Permanently:**
   Edit the `.bashrc` or `.bash_profile` file for your user:
   ```bash
   nano ~/.bashrc
   ```
   Add:
   ```bash
   export LANG=en_US.UTF-8
   export LC_ALL=en_US.UTF-8
   ```
   Save the file and reload it:
   ```bash
   source ~/.bashrc
   ```

---

### **4. Verify the Locale**
Check that the locale settings have been applied:
```bash
locale
```
You should see `en_US.UTF-8` for `LANG`, `LC_ALL`, and other variables.

---

### **5. Restart Services (If Necessary)**
If the warning persists for specific services, restart them or your system:
```bash
sudo systemctl restart <service-name>
```
Or reboot the system:
```bash
sudo reboot
```

---