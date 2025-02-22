For **n8n** running in a **Proxmox LXC container**, follow these steps to set the `WEBHOOK_URL` environment variable:

---

### **1. Set Environment Variable in the LXC Container**

1. **SSH into the LXC container:**
   ```bash
   ssh root@your-container-ip
   ```

2. **Edit or create the `.env` file** (if you installed n8n manually):
   ```bash
   nano /home/n8n/.env
   ```

3. **Add the following line:**
   ```env
   WEBHOOK_URL=https://yourdomain.com
   ```

4. **Save and close the file** (`Ctrl + X`, then `Y`, then `Enter`).

---

### **2. Apply Environment Variable in LXC Container Configuration (Persistent Approach)**

If you want the environment variable to persist across reboots, set it directly in the LXC container configuration on the **Proxmox host**:

1. **SSH into the Proxmox host:**
   ```bash
   ssh root@proxmox-ip
   ```

2. **Locate the LXC configuration file:**
   The config file is typically located at:
   ```bash
   /etc/pve/lxc/<container-id>.conf
   ```

3. **Edit the file:**
   ```bash
   nano /etc/pve/lxc/100.conf
   ```

4. **Add this line at the end** (replace `yourdomain.com` with your domain):
   ```conf
   lxc.environment = WEBHOOK_URL=https://yourdomain.com
   ```

5. **Save and close the file**.

---

### **3. Restart the LXC Container**

After applying the changes, restart your LXC container:
```bash
pct restart 100
```
*(Replace `100` with your actual container ID)*

---

### **4. Verify the Variable Inside the LXC Container**

After the restart, verify that the environment variable is set correctly:
```bash
echo $WEBHOOK_URL
```
Expected Output:
```bash
https://yourdomain.com
```

---

### **5. Restart n8n Service**
Finally, restart the **n8n** service:
```bash
sudo systemctl restart n8n
```
OR if you're running n8n directly:
```bash
n8n stop
n8n start
```

---

Now, when you check your webhook URLs in **n8n**, they should display your domain name instead of `localhost`.

If setting `WEBHOOK_URL` in your Proxmox LXC container doesn't update the webhook URL in **n8n**, it's likely because the environment variable isn't being picked up by the **n8n service** or process. Follow these steps to resolve the issue:

---

### ✅ **1. Edit the Systemd Service File for n8n**

1. **Open the n8n service file**:
   ```bash
   sudo nano /etc/systemd/system/n8n.service
   ```

2. **Modify or add the `Environment` variable** under the `[Service]` section:
   ```ini
   [Service]
   Environment="WEBHOOK_URL=https://yourdomain.com"
   ```

3. **Save the file** (`Ctrl + X`, then `Y`, then `Enter`).

4. **Reload the systemd daemon**:
   ```bash
   sudo systemctl daemon-reload
   ```

5. **Restart the n8n service**:
   ```bash
   sudo systemctl restart n8n
   ```

6. **Check the service logs** to ensure no errors:
   ```bash
   sudo journalctl -u n8n -f
   ```

---

### ✅ **2. Pass Environment Variable Directly When Starting n8n**

If you're not using a systemd service, start **n8n** like this:
```bash
WEBHOOK_URL=https://yourdomain.com n8n start
```

---

### ✅ **3. Check the n8n Config File (If Applicable)**

If you're using a configuration file, make sure it's correctly set. By default, this might be located at:
```bash
nano ~/.n8n/config
```
or
```bash
nano /etc/n8n/config
```
Add:
```env
WEBHOOK_URL=https://yourdomain.com
```

---

### ✅ **4. Verify Within n8n Itself**

After applying changes, restart n8n and create a new workflow with a **Webhook** node. Check the generated URL — it should now show your domain name.

---

If the issue persists, let me know how **n8n** is installed (Docker, npm, or directly from a package) so I can provide more specific help.