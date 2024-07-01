# Disable lid switch
https://www.reddit.com/r/Proxmox/comments/kxdjrc/i_am_running_proxmox_on_a_thinkpad_laptop_how_can/

```bash
nano /etc/systemd/logind.conf
systemctl restart systemd-logind
```

# Example
HandleLidSwitch=ignore