Creating a user with sudo privileges on a Linux system is straightforward. Follow these steps:

---

### **1. Add a New User**
Use the `adduser` command to create a new user. Replace `<username>` with the desired username.

```bash
sudo adduser <username>
```
- You will be prompted to set a password for the user and fill out optional user information.

---

### **2. Add the User to the `sudo` Group**
To grant sudo privileges, add the user to the `sudo` group (on systems like Ubuntu) or `wheel` group (on systems like CentOS/RHEL).

#### **For Ubuntu/Debian:**
```bash
sudo usermod -aG sudo <username>
```

#### **For CentOS/RHEL/AlmaLinux/RockyLinux:**
```bash
sudo usermod -aG wheel <username>
```

---

### **3. Verify Sudo Privileges**
Switch to the new user to test their sudo access:
```bash
su - <username>
```

Run a sudo command, such as:
```bash
sudo whoami
```

If the user has sudo privileges, the output will be:
```
root
```

---

### **4. (Optional) Enable Passwordless Sudo**
If you want the user to run sudo commands without being prompted for a password:
1. Edit the sudo configuration file:
   ```bash
   sudo visudo
   ```
2. Add the following line at the end of the file (replace `<username>` with the actual username):
   ```bash
   <username> ALL=(ALL) NOPASSWD:ALL
   ```

---

### **5. (Optional) Remove Sudo Privileges**
If you ever want to revoke sudo privileges:
```bash
sudo deluser <username> sudo   # Ubuntu/Debian
sudo deluser <username> wheel  # CentOS/RHEL
```

---
