https://askubuntu.com/questions/59064/how-to-run-a-checkdisk
https://linux.die.net/man/8/smartctl

### Check bad blocks
```bash
sudo badblocks -sv /dev/sda  > bad-blocks-result
```

### Check with smartctl
```bash
sudo apt-get install smartmontools
sudo smartctl -a /dev/sda | less
sudo smartctl -H /dev/sda
sudo smartctl -t short /dev/sda
```
