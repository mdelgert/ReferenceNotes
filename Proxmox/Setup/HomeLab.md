# Helper scripts
https://tteck.github.io/Proxmox/
https://community-scripts.github.io/ProxmoxVE/

# Nginx Proxy Manager LXC
https://community-scripts.github.io/ProxmoxVE/scripts?id=nginxproxymanager
```bash
bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/ct/nginxproxymanager.sh)"
```

To upgrade ngnix to latest run the script inside lxc

http://192.168.50.149:81

nginx1:81

https://github.com/community-scripts/ProxmoxVE/raw/main/ct/

Since there are hundreds of Certbot instances, it's necessary to install the specific Certbot of your preference. 
Running /app/scripts/install-certbot-plugins within the nginxproxymanager LXC shell will install many additional plugins.

Default Login Credentials
You can use the following credentials to login to the Nginx Proxy Manager ct.

Username: admin@example.com
Password: changeme

# Cloudflared LXC
https://community-scripts.github.io/ProxmoxVE/scripts?id=cloudflared
```bash
bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/ct/cloudflared.sh)"
```

# Dashy LXC
```bash
bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/ct/dashy.sh)"
```

# Docker and portainer
https://community-scripts.github.io/ProxmoxVE/scripts?id=docker
```bash
bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/ct/docker.sh)"
```
