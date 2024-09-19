# Update templates
https://benheater.com/proxmox-lxc-using-external-templates/

```bash
pveam update
```

# Proxmox LXC container automatic login
https://forum.proxmox.com/threads/proxmox-lxc-container-automatic-login.139317/
https://forum.proxmox.com/threads/is-it-possible-to-have-containers-auto-login-on-the-web-gui-like-the-node.62097/#post-391377

```sh
systemctl edit container-getty@.service
```

[Service]
ExecStart=
ExecStart=-/sbin/agetty --autologin root --noclear --keep-baud tty%I 115200,38400,9600 $TERM