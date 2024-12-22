To refresh the list of available container templates and download the latest ones on Proxmox from the command line, follow these steps:

---

### **1. Update the List of Available Templates**
Run the following command to refresh the list of available templates:
```bash
pveam update
```
This updates the cache of available templates from the Proxmox repository.

---

### **2. List Available Templates**
After updating, you can view the refreshed list of templates:
```bash
pveam available
```
This command will show all the templates available for download, including the latest versions.

---

### **3. Download the Desired Template**
Once you identify the template you want, download it using:
```bash
pveam download <storage> <template-name>
```
- Replace `<storage>` with the storage location where you want to save the template (e.g., `local`).
- Replace `<template-name>` with the name of the template you want to download (e.g., `debian-12-standard_12.0-1_amd64.tar.zst`).

Example:
```bash
pveam download local debian-12-standard_12.0-1_amd64.tar.zst
```

---

### **4. Verify Downloaded Templates**
After downloading, you can list the locally available templates to ensure the latest version is downloaded:
```bash
pveam list <storage>
```
Example:
```bash
pveam list local
```

---

### **5. Automate the Process (Optional)**
If you'd like to keep your templates updated automatically, you can create a cron job to periodically update the list and download specific templates.

1. Open the crontab editor:
   ```bash
   crontab -e
   ```
2. Add a job to refresh and download the latest template (e.g., Debian 12):
   ```bash
   0 2 * * * pveam update && pveam download local debian-12-standard_12.0-1_amd64.tar.zst
   ```

This will check for updates and download the latest version daily at 2:00 AM.

---

With these steps, you can refresh and download the latest templates directly from the Proxmox command line.
---

### **1. Check Available Templates**
1. Log in to your Proxmox server via the web GUI or SSH.
2. In the web GUI:
   - Navigate to **Datacenter** > **Storage** (e.g., `local` or `local-lvm`).
   - Click on the **CT Templates** tab to see the available templates.

---

### **2. Download Updated Templates**
If new templates are available:
1. Navigate to the **CT Templates** tab in the Proxmox web GUI.
2. Click **Templates** (top right corner).
3. Browse the list of available templates.
4. Click **Download** next to the desired template.

Alternatively, via CLI:
- Use the `pveam` (Proxmox VE Appliance Manager) command to list available templates:
  ```bash
  pveam available
  ```
- To download a specific template:
  ```bash
  pveam download <storage> <template-name>
  ```
  Example:
  ```bash
  pveam download local debian-12-standard_12.0-1_amd64.tar.zst
  ```

---

### **3. Remove Old Templates**
To free up space or remove outdated templates:
1. Navigate to the **CT Templates** tab in the web GUI.
2. Select the old template and click **Remove**.

Or via CLI:
- Use the `pveam remove` command:
  ```bash
  pveam remove <storage>:<template-name>
  ```
  Example:
  ```bash
  pveam remove local:debian-11-standard_11.0-1_amd64.tar.zst
  ```

---

### **4. Update Existing Containers (Optional)**
Existing containers won't automatically update when the template is updated. To bring them up-to-date:
- **Manually Update the OS in the Container:**
  - Access the container:
    ```bash
    pct exec <CTID> -- bash
    ```
  - Update the package manager:
    ```bash
    apt update && apt upgrade -y   # For Debian/Ubuntu
    yum update -y                  # For CentOS/RHEL
    ```
  - Exit the container:
    ```bash
    exit
    ```
- **Recreate the Container (Optional):**
  - Backup your container's data.
  - Create a new container using the updated template.

---

### **5. Automate Template Updates (Optional)**
You can schedule automatic updates of Proxmox CT templates via cron jobs:
1. Edit the cron file:
   ```bash
   crontab -e
   ```
2. Add the following line to download the latest template periodically:
   ```bash
   0 3 * * * pveam update && pveam download local <template-name>
   ```
   Replace `<template-name>` with the template you want to keep updated.

---

By following these steps, you'll ensure your Proxmox templates are up-to-date, and you can maintain consistency and security for your containers.