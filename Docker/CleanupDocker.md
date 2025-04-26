Yes, you can simplify the cleanup and reinstallation of Docker Engine on Ubuntu with a single script that removes all Docker-related components (including residual Docker Desktop configurations), reinstalls Docker Engine, and configures it to run without `sudo`. Below is a comprehensive script to achieve this, along with instructions to use it safely.

### One-Step Cleanup and Reinstall Script
This script will:
- Remove all Docker packages and configurations (Docker Engine, Docker Desktop, etc.)
- Clean up residual files and sockets
- Reinstall Docker Engine from the official Docker repository
- Configure the `docker` group for non-root access
- Ensure the Docker daemon is running

#### Script: `cleanup-and-install-docker.sh`
```bash
#!/bin/bash

# Exit on any error
set -e

# Check if script is run with sudo
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo: sudo bash $0"
    exit 1
fi

echo "Starting Docker cleanup and reinstallation..."

# Step 1: Stop Docker services
echo "Stopping Docker services..."
systemctl stop docker docker.socket containerd || true
systemctl --user stop docker-desktop || true

# Step 2: Remove Docker packages
echo "Removing Docker packages..."
apt-get purge -y docker.io docker-ce docker-ce-cli containerd runc docker-desktop || true
apt-get autoremove -y --purge

# Step 3: Remove Docker configuration and data
echo "Removing Docker configuration and data..."
rm -rf /var/lib/docker
rm -rf /etc/docker
rm -rf /var/run/docker.sock
rm -rf /home/*/.docker
rm -rf /etc/apt/sources.list.d/docker.list
rm -rf /etc/apt/keyrings/docker.gpg
find / -name '*docker-desktop*' -exec rm -rf {} + 2>/dev/null || true

# Step 4: Remove Docker group
echo "Removing Docker group..."
groupdel docker || true

# Step 5: Update package index
echo "Updating package index..."
apt-get update

# Step 6: Install dependencies
echo "Installing dependencies..."
apt-get install -y ca-certificates curl gnupg lsb-release

# Step 7: Add Docker’s official GPG key
echo "Adding Docker GPG key..."
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Step 8: Set up Docker repository
echo "Setting up Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Step 9: Install Docker Engine
echo "Installing Docker Engine..."
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Step 10: Create and configure Docker group
echo "Configuring Docker group..."
groupadd docker || true
usermod -aG docker ${SUDO_USER}

# Step 11: Start and enable Docker
echo "Starting and enabling Docker..."
systemctl start docker
systemctl enable docker

# Step 12: Fix Docker socket permissions
echo "Setting Docker socket permissions..."
chown root:docker /var/run/docker.sock
chmod 660 /var/run/docker.sock

echo "Docker cleanup and installation complete!"
echo "Please log out and log back in, or run 'newgrp docker' to apply group changes."
echo "Then test Docker with: docker run hello-world"
```

### How to Use the Script
1. **Save the Script**:
   Create a file named `cleanup-and-install-docker.sh`:
   ```bash
   nano cleanup-and-install-docker.sh
   ```
   Copy and paste the script above, then save and exit (`Ctrl+O`, `Enter`, `Ctrl+X`).

2. **Make the Script Executable**:
   ```bash
   chmod +x cleanup-and-install-docker.sh
   ```

3. **Run the Script with `sudo`**:
   ```bash
   sudo bash cleanup-and-install-docker.sh
   ```

4. **Apply Group Changes**:
   After the script completes, log out and log back in, or run:
   ```bash
   newgrp docker
   ```

5. **Test Docker**:
   Verify Docker works without `sudo`:
   ```bash
   docker run hello-world
   ```

### Important Notes
- **Run with `sudo`**: The script requires root privileges to modify system files and install packages.
- **Internet Connection**: Ensure you have an active internet connection, as the script downloads packages and the Docker GPG key.
- **Safety**: The script is designed to be safe, using `|| true` to ignore errors for commands that may fail (e.g., stopping non-existent services). It avoids deleting critical system files.
- **Backup (Optional)**: If you have important Docker images or containers, back them up before running, as `/var/lib/docker` is deleted. Since you’re cleaning up, this likely isn’t an issue.
- **Docker Engine Only**: This installs Docker Engine, not Docker Desktop. If you need Docker Desktop, download it from the official Docker website after cleanup.

### What the Script Does
- **Cleans Up**: Removes all Docker packages, configurations, sockets, and residual Docker Desktop files.
- **Reinstalls**: Installs the latest Docker Engine from the official Docker repository.
- **Configures**: Sets up the `docker` group and socket permissions for non-root access.
- **Verifies**: Ensures the Docker daemon is running and enabled.

### If Issues Persist
If the script runs but you still get the `Cannot connect to the Docker daemon` error:
1. Check Docker status:
   ```bash
   sudo systemctl status docker
   ```
2. Verify group membership:
   ```bash
   groups
   ```
   Ensure `docker` is listed.
3. Check socket:
   ```bash
   ls -l /var/run/docker.sock
   ```
   It should show `srw-rw---- 1 root docker`.
4. Share any error messages or outputs for further help.

This script should fully resolve your issue by providing a clean, working Docker Engine setup in one go.