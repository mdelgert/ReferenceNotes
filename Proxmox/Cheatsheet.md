**Proxmox Command-Line Interface (CLI) Cheatsheet** with some of the most useful commands for managing Proxmox Virtual Environment (PVE):

---

### **General System Management**
1. **Check Proxmox VE Version**
   ```bash
   pveversion
   ```

2. **Update Proxmox**
   ```bash
   apt update && apt full-upgrade
   ```

3. **Restart Proxmox Services**
   ```bash
   systemctl restart pveproxy
   systemctl restart pvedaemon
   systemctl restart pvestatd
   ```

4. **Check Proxmox Logs**
   ```bash
   journalctl -u pveproxy
   ```

5. **Access Web Interface Port**
   ```bash
   nano /etc/default/pveproxy  # Change web interface port if needed
   ```

---

### **VM and Container Management**
1. **List All VMs and Containers**
   ```bash
   qm list           # Virtual Machines
   pct list          # Containers
   ```

2. **Start, Stop, or Restart a VM**
   ```bash
   qm start <vmid>
   qm stop <vmid>
   qm restart <vmid>
   ```

3. **Start, Stop, or Restart a Container**
   ```bash
   pct start <ctid>
   pct stop <ctid>
   pct restart <ctid>
   ```

4. **Create a New VM**
   ```bash
   qm create <vmid> --name <vmname> --memory <size> --cores <cores> --net0 virtio,bridge=vmbr0
   ```

5. **Migrate VM to Another Node**
   ```bash
   qm migrate <vmid> <target-node>
   ```

6. **Resize VM Disk**
   ```bash
   qm resize <vmid> <disk> +10G
   ```

7. **Backup a VM or Container**
   ```bash
   vzdump <vmid> --dumpdir /backup/location --mode snapshot
   ```

8. **Restore a VM or Container**
   ```bash
   qmrestore /backup/location/dumpfile.vma <new-vmid>
   pct restore <ctid> /backup/location/dumpfile.tar.lzo
   ```

---

### **Storage Management**
1. **List Storage**
   ```bash
   pvesm status
   ```

2. **Add Local Storage**
   ```bash
   pvesm add dir <storagename> --path /path/to/storage
   ```

3. **Remove Storage**
   ```bash
   pvesm remove <storagename>
   ```

4. **List Disks**
   ```bash
   lsblk
   ```

5. **Format Disk for Proxmox**
   ```bash
   mkfs.ext4 /dev/sdX
   ```

6. **Mount Disk**
   ```bash
   mount /dev/sdX /mnt/<mountpoint>
   ```

---

### **Networking**
1. **List Network Interfaces**
   ```bash
   ip addr
   ```

2. **Restart Networking Service**
   ```bash
   systemctl restart networking
   ```

3. **Edit Network Config**
   ```bash
   nano /etc/network/interfaces
   ```

4. **Apply Network Changes**
   ```bash
   ifreload -a
   ```

---

### **User and Permission Management**
1. **Add a New User**
   ```bash
   pveum useradd <username>@pve --password <password>
   ```

2. **Assign Permissions**
   ```bash
   pveum aclmod / -user <username>@pve -role <role>
   ```

3. **List Users**
   ```bash
   pveum user list
   ```

4. **Delete a User**
   ```bash
   pveum userdel <username>@pve
   ```

---

### **Cluster Management**
1. **Check Cluster Status**
   ```bash
   pvecm status
   ```

2. **Add a Node to Cluster**
   ```bash
   pvecm add <master-node-ip>
   ```

3. **Remove a Node from Cluster**
   ```bash
   pvecm delnode <node-name>
   ```

4. **List Cluster Nodes**
   ```bash
   pvecm nodes
   ```

---

### **Backup and Restore**
1. **Schedule Backups**
   ```bash
   nano /etc/cron.d/vzdump
   ```

2. **Manual Snapshot Backup**
   ```bash
   vzdump <vmid> --mode snapshot --dumpdir /path/to/backup
   ```

3. **Restore from Backup**
   ```bash
   qmrestore /path/to/backup/dumpfile.vma <new-vmid>
   ```

---

### **Debugging and Troubleshooting**
1. **Check VM Status**
   ```bash
   qm status <vmid>
   ```

2. **Access VM Console**
   ```bash
   qm terminal <vmid>
   ```

3. **Access Container Console**
   ```bash
   pct enter <ctid>
   ```

4. **List Running Tasks**
   ```bash
   pveproxy worker
   ```

5. **Check for Errors**
   ```bash
   dmesg | grep -i error
   ```

6. **Ping Another Node**
   ```bash
   ping <node-ip>
   ```

---

### **Other Utilities**
1. **Restart Proxmox Host**
   ```bash
   reboot
   ```

2. **Shutdown Proxmox Host**
   ```bash
   poweroff
   ```

3. **Change Hostname**
   ```bash
   hostnamectl set-hostname <new-hostname>
   ```

4. **View Disk Usage**
   ```bash
   df -h
   ```

---
