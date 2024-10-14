
---

# UFW on Debian - Quick Start Guide

This guide provides a basic overview of installing and using `ufw` on Debian, including setting up some common firewall rules.

## Table of Contents

- [What is UFW?](#what-is-ufw)
- [Installing UFW](#installing-ufw)
- [Basic Commands](#basic-commands)
- [Common Rules](#common-rules)
- [Advanced Rules](#advanced-rules)
- [Checking UFW Status](#checking-ufw-status)

---

### What is UFW?

**UFW (Uncomplicated Firewall)** is a user-friendly front-end for managing iptables firewall rules. It simplifies the process of managing incoming and outgoing connections on your Debian system.

---

### Installing UFW

1. **Update Package Index**  
   Ensure your package index is up-to-date:

   ```bash
   sudo apt update
   ```

2. **Install UFW**  
   Install the `ufw` package:

   ```bash
   sudo apt install ufw
   ```

3. **Enable UFW**  
   Enable `ufw` to start on boot and activate it:

   ```bash
   sudo ufw enable
   ```

4. **Check UFW Status**  
   Confirm that `ufw` is active:

   ```bash
   sudo ufw status
   ```

---

### Basic Commands

- **Enable UFW**  
  To start the firewall:

  ```bash
  sudo ufw enable
  ```

- **Disable UFW**  
  To stop the firewall:

  ```bash
  sudo ufw disable
  ```

- **Allow a Port**  
  Open a specific port, such as SSH on port 22:

  ```bash
  sudo ufw allow 22
  ```

- **Deny a Port**  
  Block a specific port:

  ```bash
  sudo ufw deny 22
  ```

- **Delete a Rule**  
  To remove a specific rule, specify the action and port:

  ```bash
  sudo ufw delete allow 22
  ```

---

### Common Rules

Here are some basic rules you might use to secure your server.

- **Allow SSH Access**  
  SSH typically uses port 22. Ensure you don’t lock yourself out by allowing SSH before enabling `ufw`:

  ```bash
  sudo ufw allow ssh
  ```

- **Allow HTTP and HTTPS Traffic**  
  For web servers, allow HTTP (80) and HTTPS (443) traffic:

  ```bash
  sudo ufw allow http
  sudo ufw allow https
  ```

- **Allow a Specific Port**  
  For custom applications running on non-standard ports, specify the port number:

  ```bash
  sudo ufw allow 8080
  ```

- **Allow a Range of Ports**  
  For applications requiring multiple ports:

  ```bash
  sudo ufw allow 1000:2000/tcp
  ```

- **Allow Specific IPs**  
  Allow SSH access from a specific IP:

  ```bash
  sudo ufw allow from 192.168.1.100 to any port 22
  ```

---

### Advanced Rules

- **Limit SSH Connections**  
  To protect against brute-force attacks, limit SSH connections:

  ```bash
  sudo ufw limit ssh
  ```

- **Allow Subnets**  
  Allow access from a subnet (example: 192.168.1.0/24):

  ```bash
  sudo ufw allow from 192.168.1.0/24
  ```

- **Deny All Incoming Connections**  
  For a highly restrictive firewall policy:

  ```bash
  sudo ufw default deny incoming
  ```

- **Allow All Outgoing Connections**  
  Allow all outgoing connections while blocking all incoming:

  ```bash
  sudo ufw default allow outgoing
  ```

---

### Checking UFW Status

To review the status and current rules of `ufw`:

```bash
sudo ufw status verbose
```

For a more detailed view of rules:

```bash
sudo ufw show raw
```

---

### Example Configuration

A minimal setup allowing SSH, HTTP, and HTTPS might look like this:

```bash
# Enable UFW
sudo ufw enable

# Default deny all incoming
sudo ufw default deny incoming

# Default allow all outgoing
sudo ufw default allow outgoing

# Allow SSH
sudo ufw allow ssh

# Allow HTTP and HTTPS
sudo ufw allow http
sudo ufw allow https

# Check status
sudo ufw status verbose
```

---

