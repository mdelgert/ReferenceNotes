To add Home Assistant to Nginx Proxy Manager (NPM) using the web interface, follow these steps:

---

### **1. Prerequisites**
- Ensure Home Assistant is running and accessible (e.g., `http://<LOCAL-IP>:8123`).
- Nginx Proxy Manager is installed and running.

---

### **2. Log In to Nginx Proxy Manager**
- Open the NPM web interface (e.g., `http://<NPM-HOSTNAME>:81`).
- Log in with your credentials.

---

### **3. Add a New Proxy Host**
1. **Click on "Proxy Hosts"** in the left menu.
2. **Add a New Host** by clicking the "Add Proxy Host" button.

#### **Details for the Proxy Host:**
- **Domain Names**: Enter the domain or subdomain you want to use (e.g., `home.example.com`).
- **Scheme**: Select `http` (if you use SSL for Home Assistant, select `https`).
- **Forward Hostname / IP**: Enter the IP address or hostname of your Home Assistant instance (e.g., `192.168.1.100`).
- **Forward Port**: Enter `8123` (the default Home Assistant port).
- **Cache Assets**: Leave unchecked unless required.
- **Block Common Exploits**: Enable.
- **Websockets Support**: Enable (important for Home Assistant).

---

### **4. SSL Configuration**
- **Enable SSL**: Check the "Enable SSL" box.
- **SSL Certificate**:
  - If you have a valid certificate, upload it.
  - If not, use the "Request a new SSL certificate" option to obtain one via Let's Encrypt.
- **Force SSL**: Enable to redirect HTTP traffic to HTTPS.
- **HTTP/2 Support**: Enable.

---

### **5. Save the Configuration**
- Click "Save" to apply the settings.

---

### **6. Test Access**
- Open your browser and navigate to the domain or subdomain you configured (e.g., `https://home.example.com`).
- Ensure you can access the Home Assistant login page.

---

### **Additional Tips**
- If you're using a firewall, ensure port `443` (HTTPS) and `80` (HTTP) are open for Nginx Proxy Manager.
- In Home Assistant, update the `base_url` in the `configuration.yaml` file to reflect the new URL (e.g., `https://home.example.com`).

- If proxmox script in docker this is the path
nano /var/lib/docker/volumes/hass_config/_data/configuration.yaml

- I had issues and need to clear my browser cache data during setup like I had with ngnix login issues
- Edge I did not have this issue may be a bug with current version
https://community.home-assistant.io/t/login-page-over-and-over/83522
- May need to setup a new instance without proxmox installer scripts and or may want to test with full homeos

```yaml
# Loads default set of integrations. Do not remove.
default_config:

# Configure HTTP and proxy settings
http:
  use_x_forwarded_for: true
  trusted_proxies:
    - 192.168.1.0/24  # Replace with your Nginx Proxy Manager subnet
    - 192.168.50.240  # Nginx Proxy Manager IP
    - 127.0.0.1       # Include localhost for Docker setups
    #- 192.168.50.0/24  # Or the entire subnet

# Load frontend themes from the themes folder
frontend:
  themes: !include_dir_merge_named themes

automation: !include automations.yaml
script: !include scripts.yaml
scene: !include scenes.yaml
```

After making changes to `configuration.yaml`, restart Home Assistant.

Let me know if you need further guidance!