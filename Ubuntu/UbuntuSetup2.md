# Make Ubuntu Not Go in Suspend When Laptop Lid is Closed
https://itsfoss.com/laptop-lid-suspend-ubuntu/
sudo nano /etc/systemd/logind.conf
HandleLidSwitch=ignore
HandleLidSwitchExternalPower=ignore
HandleLidSwitchDocked=ignore

### Disable X

```bash
systemctl get-default #you should see graphical.target
sudo systemctl set-default multi-user.target
sudo reboot
```

### **Reverting the Change (Optional)**
```bash
sudo systemctl set-default graphical.target
sudo reboot
```