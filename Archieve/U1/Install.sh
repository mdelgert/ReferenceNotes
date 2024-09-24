#!/bin/bash

# Update package lists
sudo apt update

# Install Git
sudo apt install -y git

# Install Neofetch
sudo apt install -y neofetch

# Install OpenSSH Server
sudo apt install -y openssh-server

# Enable and start the OpenSSH service
sudo systemctl enable ssh
sudo systemctl start ssh

# Display installed versions
echo "Installed versions:"
git --version
neofetch --version
ssh -V

echo "Installation complete!"
