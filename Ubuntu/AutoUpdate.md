# Ubuntu Automatic Updates

This guide explains how to enable and configure automatic updates on an Ubuntu system to ensure security patches and software updates are applied without manual intervention.

## 1. Enable Unattended Upgrades
Ubuntu provides the `unattended-upgrades` package to automatically install updates.

### Install Unattended Upgrades
Run the following command to install the necessary package:
```bash
sudo apt update && sudo apt install -y unattended-upgrades
```

### Enable Unattended Upgrades
To enable automatic updates, run:
```bash
sudo dpkg-reconfigure unattended-upgrades
```

This will enable automatic security updates.

## 2. Configure Unattended Upgrades
The main configuration file is located at:
```bash
/etc/apt/apt.conf.d/50unattended-upgrades
```

Edit the file using:
```bash
sudo nano /etc/apt/apt.conf.d/50unattended-upgrades
```

Ensure the following lines are present and uncommented:
```json
Unattended-Upgrade::Allowed-Origins {
    "${distro_id}:${distro_codename}-security";
    "${distro_id}:${distro_codename}-updates";
    "${distro_id}:${distro_codename}-backports";
};
```
This allows security updates, updates, and backports to be installed automatically.

## 3. Configure Automatic Reboots (Optional)
If you want the system to automatically reboot after updates, edit the following file:
```bash
sudo nano /etc/apt/apt.conf.d/50unattended-upgrades
```
Find and set:
```json
Unattended-Upgrade::Automatic-Reboot "true";
Unattended-Upgrade::Automatic-Reboot-Time "03:00";
```
This will reboot the system at 3:00 AM after installing updates if necessary.

## 4. Enable Periodic Updates
Edit the periodic update configuration:
```bash
sudo nano /etc/apt/apt.conf.d/10periodic
```
Ensure the following settings are present:
```json
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Download-Upgradeable-Packages "1";
APT::Periodic::AutocleanInterval "7";
APT::Periodic::Unattended-Upgrade "1";
```

## 5. Verify the Configuration
You can manually trigger unattended upgrades to verify they work correctly:
```bash
sudo unattended-upgrades --dry-run --debug
```

To check logs for automatic updates:
```bash
sudo journalctl -u unattended-upgrades.service
```

## 6. Disable Automatic Updates (If Needed)
To disable automatic updates, run:
```bash
sudo systemctl stop unattended-upgrades
sudo systemctl disable unattended-upgrades
```

## Conclusion
Following these steps will ensure that your Ubuntu system stays updated automatically, improving security and reducing maintenance efforts.

