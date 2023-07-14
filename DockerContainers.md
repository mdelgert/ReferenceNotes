
https://awesome-docker.netlify.app/
https://www.smarthomebeginner.com/best-docker-containers-for-home-server/
https://4sysops.com/archives/the-best-docker-containers/
https://hub.docker.com/r/vaultwarden/server
https://github.com/dani-garcia/vaultwarden
https://guacamole.apache.org/
https://hub.docker.com/r/linuxserver/openvscode-server

# Application Dashboard
https://heimdall.site/
https://hub.docker.com/r/linuxserver/heimdall/

# Network monitoring
https://github.com/louislam/uptime-kuma
https://github.com/louislam/uptime-kuma/wiki/How-to-Monitor-Docker-Containers

docker run -d --restart=always -p 3001:3001 -v uptime-kuma:/app/data --name uptime-kuma louislam/uptime-kuma:1

docker run -d --restart=always -p 3001:3001 -v uptime-kuma:/app/data -v /var/run/docker.sock:/var/run/docker.sock --name uptime-kuma louislam/uptime-kuma:1

# Bitwarden
https://www.makeuseof.com/self-host-bitwarden-password-manager-raspberry-pi-zero/

# Node-RED
https://nodered.org/docs/getting-started/docker
docker run -it -p 1880:1880 -v /home/mdelgert/shared/nodered:/data --name mynodered nodered/node-red

# RSS
https://www.freshrss.org/
https://github.com/FreshRSS/FreshRSS

# METUBE yt-dl
https://github.com/alexta69/metube

# Useful tools for developer and people working in IT
https://github.com/CorentinTh/it-tools
docker run -d --name it-tools --restart unless-stopped -p 8080:80 corentinth/it-tools:latest

# Webtop
https://docs.linuxserver.io/images/docker-webtop
https://github.com/linuxserver/docker-webtop

docker run -d \
  --name=webtop \
  #--security-opt seccomp=unconfined `#optional` \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -e SUBFOLDER=/ `#optional` \
  -e TITLE=Webtop `#optional` \
  -p 3000:3000 \
  -p 3001:3001 \
  -v /path/to/data:/config \
  -v /var/run/docker.sock:/var/run/docker.sock `#optional` \
  --device /dev/dri:/dev/dri `#optional` \
  --shm-size="1gb" `#optional` \
  --restart unless-stopped \
  lscr.io/linuxserver/webtop:latest


docker run -d \
  --name=webtop \
  #--security-opt seccomp=unconfined `#optional` \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -e SUBFOLDER=/ `#optional` \
  -e TITLE=Webtop `#optional` \
  -p 3000:3000 \
  -p 3001:3001 \
  -v /home/mdelgert/data:/config \
  -v /var/run/docker.sock:/var/run/docker.sock `#optional` \
  --device /dev/dri:/dev/dri `#optional` \
  --shm-size="1gb" `#optional` \
  --restart unless-stopped \
  lscr.io/linuxserver/webtop:ubuntu-kde


