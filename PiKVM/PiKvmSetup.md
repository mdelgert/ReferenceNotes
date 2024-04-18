https://docs.pikvm.org/first_steps/
https://pikvm/

# Default users
root:root
admin:admin

# Change password
```bash
ssh root@pikvm 
rw
passwd root
kvmd-htpasswd set admin
ro
```

# Update OS
```bash
pikvm-update
```

# Change hostname
```bash
hostnamectl set-hostname yournewhostname.domain
```

# Enable 2FA
```bash
kvmd-totp init
```

# Disable 2FA
```bash
kvmd-totp show
kvmd-totp del
```

# Enabling Jiggler
```bash
rw
nano /etc/kvmd/override.yaml
systemctl restart kvmd
ro
```
kvmd:
    hid:
        jiggler:
            enabled: true
            active: true

# Disabling Mass Storage
https://docs.pikvm.org/msd/#manual-drives-management
https://docs.pikvm.org/faq/#common-questions

rw
nano /etc/kvmd/override.yaml
reboot

kvmd:
    msd:
        type:  disabled

otg:
    manufacturer: Corsair
    product: Corsair Gaming RGB
    vendor_id: 0x6940
    product_id: 0x6973
    serial:

# Editing EDID
https://docs.pikvm.org/edid/#edid-examples-for-v4
kvmd-edidconf --set-mfc-id=AUS --set-monitor-name=VG279QL1A-V