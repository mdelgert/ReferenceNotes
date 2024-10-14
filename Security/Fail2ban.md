Fail2ban is an intrusion prevention software framework that protects servers from brute-force attacks. It works by monitoring log files for patterns of failed authentication attempts or other suspicious behavior and then automatically banning the offending IP addresses using firewall rules.

Here's a breakdown of how to install, configure, monitor, and extend Fail2ban on Debian, including setting up email and other notifications.

### 1. **Installing Fail2ban on Debian**

To install Fail2ban on Debian, use the following commands:

```bash
sudo apt update
sudo apt install fail2ban -y
```

This installs Fail2ban and starts it as a service.

### 2. **Basic Configuration and Monitoring**

Fail2ban’s configuration is in the `/etc/fail2ban/` directory. The main configuration file is `jail.conf`, but it’s recommended to override settings in `jail.local` to avoid updates overwriting custom configurations.

To create a basic configuration, copy the default file:

```bash
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
```

Then, edit `jail.local` to configure which services to monitor (called “jails”).

```bash
sudo nano /etc/fail2ban/jail.local
```

To enable SSH protection, ensure the following lines are included:

```ini
[sshd]
enabled = true
port = ssh
logpath = /var/log/auth.log
maxretry = 5
bantime = 3600
```

### 3. **Common Fail2ban Commands**

To monitor Fail2ban's operation and manage bans, use the following commands:

```bash
# Check status of Fail2ban
sudo systemctl status fail2ban

# View all active jails and banned IPs
sudo fail2ban-client status

# Check status of a specific jail, e.g., SSH
sudo fail2ban-client status sshd

# Unban an IP (e.g., 192.168.1.100)
sudo fail2ban-client set sshd unbanip 192.168.1.100
```

### 4. **Adding Additional Services (Jails)**

Fail2ban has default jails for common services, but you can add more. To add a new jail, add a section to `jail.local`. For example, to protect an Nginx service:

```ini
[nginx-http-auth]
enabled = true
port = http,https
logpath = /var/log/nginx/error.log
maxretry = 3
bantime = 600
```

### 5. **Testing Fail2ban**

To ensure Fail2ban is working, run this script to simulate failed login attempts and check if your IP gets banned:

```bash
#!/bin/bash
# Install sshpass if not already installed
sudo apt install sshpass -y

# Replace 'username' with an actual username on the system that Fail2ban is monitoring
for i in {1..6}; do
    sshpass -p "wrongpassword" ssh -o StrictHostKeyChecking=no username@localhost
done
```

After a few failed attempts, Fail2ban should ban your IP. You can confirm the ban with:

```bash
sudo fail2ban-client status sshd
```

### 6. **Sending Notification Emails Through Gmail**

Fail2ban can send ban notifications through email by configuring an action. To use Gmail’s SMTP, install `ssmtp`:

```bash
sudo apt install ssmtp mailutils
```

Then, edit `/etc/ssmtp/ssmtp.conf`:

```ini
root=youremail@gmail.com
mailhub=smtp.gmail.com:587
AuthUser=youremail@gmail.com
AuthPass=yourpassword
UseTLS=YES
UseSTARTTLS=YES
```

In `jail.local`, set the `action` line to include email notifications:

```ini
[sshd]
enabled = true
action = %(action_mwl)s
```

### 7. **Sending Notifications via `ntfy`**

1. Install the `ntfy` command-line tool:

   ```bash
   sudo apt install ntfy
   ```

2. Create a custom action file for `ntfy` notifications. Save the following script as `/etc/fail2ban/action.d/ntfy.conf`:

   ```ini
   [Definition]
   actionstart = ntfy publish "Fail2ban started monitoring {JAIL} service."
   actionban = ntfy publish "Banned IP <ip> in jail {JAIL}."
   actionunban = ntfy publish "Unbanned IP <ip> from jail {JAIL}."
   ```

3. Update `jail.local` to use this action for notifications:

   ```ini
   [sshd]
   enabled = true
   action = ntfy
   ```

4. To check notifications, run Fail2ban and test with simulated failed login attempts.

### 8. **Final Steps and Restarting Fail2ban**

After any configuration change, restart Fail2ban to apply the settings:

```bash
sudo systemctl restart fail2ban
```

### Summary

This setup protects your server from unauthorized access attempts on multiple services, notifying you of any bans via email and `ntfy`. This makes it adaptable and easy to monitor through various messaging agents.

### References

For more details, you can check the [Fail2ban documentation](https://www.fail2ban.org/) and [ntfy documentation](https://ntfy.sh/).