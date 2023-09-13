# Exposed ports in the container view redirect me to 0.0.0.0. What can I do?
https://portal.portainer.io/knowledge/exposed-ports-in-the-container-view-redirect-me-to-0.0.0.0-what-can-i-do
https://earthly.dev/blog/explore-portainer-as-tool/
https://www.virtualizationhowto.com/2022/12/portainer-agent-manage-remote-docker-environment/

# Adding docker hosts
docker run -d -p 9001:9001 --name portainer_agent --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker/volumes:/var/lib/docker/volumes portainer/agent:latest

https://docs.portainer.io/start/install-ce/server/docker/linux

docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
https://localhost:9443

# PiHole Template

version: "3"

# More info at https://github.com/pi-hole/docker-pi-hole/ and https://docs.pi-hole.net/
services:
  pihole:
    container_name: pihole
    image: pihole/pihole:latest
    # For DHCP it is recommended to remove these ports and instead add: network_mode: "host"
    ports:
      - "53:53/tcp"
      - "53:53/udp"
      #- "67:67/udp" # Only required if you are using Pi-hole as your DHCP server
      - "80:80/tcp"
    environment:
      #TZ: 'America/Chicago'
      TZ: 'America/New_York'
      # WEBPASSWORD: 'set a secure password here or it will be random'
      WEBPASSWORD: 'password'
    # Volumes store your data between container upgrades
    volumes:
      - './etc-pihole:/etc/pihole'
      - './etc-dnsmasq.d:/etc/dnsmasq.d'
    #   https://github.com/pi-hole/docker-pi-hole#note-on-capabilities
    cap_add:
      - NET_ADMIN # Required if you are using Pi-hole as your DHCP server, else not needed
    restart: unless-stopped