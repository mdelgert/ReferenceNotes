### Links
https://multipass.run/
https://github.com/canonical/multipass/
https://medium.com/@paulrobu/how-to-run-ubuntu-22-04-vms-on-apple-m1-arm-based-systems-for-free-c8283fb38309
https://formulae.brew.sh/cask/multipass#default
https://multipass.run/docs/remove-an-instance
https://medium.com/@suneel.omrey/move-show-applications-right-to-left-of-the-dock-in-ubuntu-18-04-9592dfd18c9a

### Remove
```bash
multipass list
multipass delete instance_name
multipass delete --all
multipass purge
multipass list
```

### Install 
```bash
brew install multipass
multipass version
```

### Setup ubuntu
```bash
multipass find
multipass launch 22.04 -n primary -c 2 -m 4G -d 50G
multipass shell primary
sudo apt update && sudo apt upgrade
sudo apt install ubuntu-desktop xrdp -y
sudo passwd ubuntu
sudo adduser username
sudo usermod -aG sudo username
```

### Packages
```bash
sudo apt install gnome-tweaks
```