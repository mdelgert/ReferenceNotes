# Hostname on pikvm on same network issue
https://www.reddit.com/r/pikvm/comments/qci0zi/hostname_on_pikvm_on_same_network_issue/
hostnamectl set-hostname pikvm2

# Multiport KVM over IP
https://docs.pikvm.org/multiport/
https://docs.pikvm.org/ezcoo/#adding-ui-elements-to-control-the-kvm-switch

nano /etc/kvmd/override.yaml

# CHange device Id's
https://github.com/pikvm/pikvm/blob/master/docs/ezcoo.md
https://docs.pikvm.org/edid/#editing-edid
https://www.reddit.com/r/pikvm/comments/w0tl7t/kvmd_3121_edid_changes/

# Run this command as root from bash and reboot
kvmd-edidconf --set-mfc-id=LNX --set-monitor-name=PiKVM
kvmd-edidconf --set-mfc-id=TSB --set-monitor-name=Toshiba-H2C
kvmd-edidconf --set-mfc-id=AUS --set-monitor-name=VG279QL1A-V

# Update
rw
pacman -Syu
reboot

# ✮ ✮ ✮ CHANGE THE PASSWORDS! ✮ ✮ ✮
https://pikvm/
Linux admin (SSH, etc.): user root, password root.
PiKVM Web Interface: user admin, password admin, no 2FA code.

rw
passwd root
kvmd-htpasswd set admin
ro