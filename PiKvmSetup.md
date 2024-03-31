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