# Mount points
https://pve.proxmox.com/wiki/Linux_Container#_bind_mount_points

# Remove Proxmox Subscription Notice
https://johnscs.com/remove-proxmox51-subscription-notice/

```bash
sed -Ezi.bak "s/(function\(orig_cmd\) \{)/\1\n\torig_cmd\(\);\n\treturn;/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js && systemctl restart pveproxy.service
```

# Update templates
https://pve.proxmox.com/wiki/Linux_Container

```bash
pveam update
pveam available
```

