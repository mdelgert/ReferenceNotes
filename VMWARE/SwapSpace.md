### Swap space

VMware Workstation recommends 8 GB of system swap space for the set of currently running virtual machines. 8 GB of system swap space is available. For optimum performance increase the amount of system swap space, or configure all virtual machine memory to use reserved host RAM under Preferences.

This message from VMware Workstation suggests that while your current swap space meets the minimum requirement (8GB), increasing it could improve performance. Here are ways to resolve it:

It looks like your system has a swap file named **`/swap.img`** instead of `/swapfile`. You can verify if `swap.img` is being used as swap by running:

```bash
swapon --show
```

If `swap.img` appears in the output, then your system is already using it as swap.

### **Option 1: Keep `swap.img` (If It's Working)**
If `swap.img` is already active and sufficient, you don’t need to create `/swapfile`. Instead, you can **increase its size** if necessary:

1. Disable current swap:
   ```bash
   sudo swapoff /swap.img
   ```
2. Resize `swap.img` (e.g., to 16GB):
   ```bash
   sudo fallocate -l 16G /swap.img
   ```
   (Or use `dd` if `fallocate` isn't available:)
   ```bash
   sudo dd if=/dev/zero of=/swap.img bs=1G count=16
   ```
3. Set proper permissions:
   ```bash
   sudo chmod 600 /swap.img
   ```
4. Mark it as swap:
   ```bash
   sudo mkswap /swap.img
   ```
5. Re-enable swap:
   ```bash
   sudo swapon /swap.img
   ```
6. Ensure it persists across reboots: 
(by default this exsists in ubuntu new install this should not be needed)
   ```bash
   #echo '/swap.img none swap sw 0 0' | sudo tee -a /etc/fstab
   ```
7. Verify this line already exsists (/swap.img none swap sw 0 0)
```bash
sudo nano /etc/fstab
```

9. Verify swap resized
```bash
swapon --show
```