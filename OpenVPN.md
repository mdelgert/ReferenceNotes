# OpenVPN - How to Install and Configure OpenVPN Client on Ubutun | Debian | LinuxMint
https://www.youtube.com/watch?v=rCcGC_VYrWc

# OpenVPN 3 Linux

```bash
sudo apt install apt-transport-https curl
lsb_release -a
sudo mkdir -p /etc/apt/keyrings && curl -fsSL https://packages.openvpn.net/packages-repo.gpg | sudo tee /etc/apt/keyrings/openvpn.asc
DISTRO=$(lsb_release -c | awk '{print $2}')
echo $DISTRO
echo "deb [signed-by=/etc/apt/keyrings/openvpn.asc] https://packages.openvpn.net/openvpn3/debian $DISTRO main" | sudo tee /etc/apt/sources.list.d/openvpn-packages.list
sudo apt update
sudo apt install openvpn3
```

# Starting a one-shot configuration profile
```bash
openvpn3 session-start --config ${MY_CONFIGURATION_FILE}
openvpn3 sessions-list
openvpn3 session-manage --session-path /net/openvpn/v3/sessions/..... --disconnect
openvpn3 configs-list
```

# OpenVPN 3 Linux
https://community.openvpn.net/openvpn/wiki/OpenVPN3Linux?_gl=1*swwulh*_ga*MTcyODkzMjQ4OC4xNzIwNTAxNTA1*_ga_E45Z33NTV7*MTcyMDUwMTUwNS4xLjEuMTcyMDUwMTU2OC4wLjAuMTk4MTM1ODY4MQ..*_fplc*QXlrdENMdXdCT2ZMOU0lMkJRajJ1MVQyektJMjVYOWNRV0FkVUJzVkJvYUY5cjQwY1NkS0IzSFNEWDY3MFhEbm1XT3dKb0NzbDh0eXEzQlNFbXBNeTZiNVBEOUZpU3cyem9VeUI1R2tJWWNOeDE5WENJU1dOYzNnVGVoWktsT0ElM0QlM0Q.

# Learn to Install and Control the OpenVPN 3 Client
https://openvpn.net/cloud-docs/tutorials/configuration-tutorials/connectors/operating-systems/linux/tutorial--learn-to-install-and-control-the-openvpn-3-client.html