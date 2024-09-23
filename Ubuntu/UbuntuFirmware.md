https://itsfoss.com/update-firmware-ubuntu/
https://askubuntu.com/questions/1394105/how-can-i-upgrade-my-device-firmware-from-the-command-line

```bash
sudo apt install fwupd
sudo fwupdmgr get-devices
sudo fwupdmgr get-updates
sudo fwupdmgr update
```