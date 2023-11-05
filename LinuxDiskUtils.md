### Check bad blocks
https://askubuntu.com/questions/59064/how-to-run-a-checkdisk

```bash
sudo badblocks -sv /dev/sda  > bad-blocks-result
```

### Check with smartctl
https://linux.die.net/man/8/smartctl

```bash
sudo apt install smartmontools
sudo smartctl -a /dev/sda | less
sudo smartctl -H /dev/sda
sudo smartctl -t short /dev/sda
```

### Samsung update firmware
https://www.cyberciti.biz/faq/upgrade-update-samsung-ssd-firmware/
https://github.com/fwupd/fwupd/wiki/PluginFlag:capsules-unsupported
https://forums.raspberrypi.com/viewtopic.php?t=345609
https://community.frame.work/t/solved-samsung-ssd-980-pro-firmware-update-on-linux-how/27046/11
https://blog.quindorian.org/2021/05/firmware-update-samsung-ssd-in-linux.html/

```bash
sudo apt install fwupd
systemctl status fwupd-refresh
sudo fwupdmgr update
```