#!/bin/bash

# Example script to simulate a brute-force attack on an SSH server
#sudo apt-get install sshpass

# Configuration
HOST="192.168.50.1"   # Replace with the IP of the SSH server
USERNAME="HackWell" # Invalid username for brute-force testing
PASSWORD="invalid_password" # Invalid password for brute-force testing
ATTEMPTS=10             # Number of failed login attempts

echo "Triggering brute-force alert with $ATTEMPTS failed login attempts..."

for i in $(seq 1 $ATTEMPTS); do
    sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no -o ConnectTimeout=3 "$USERNAME@$HOST" exit
    if [ $? -ne 0 ]; then
        echo "Failed login attempt $i"
    fi
    sleep 1  # Short delay between attempts
done

echo "Brute-force simulation completed."
