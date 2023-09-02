### Ntfy
https://ntfy.sh/
https://www.youtube.com/watch?v=poDIT2ruQ9M&t=471s
https://github.com/binwiederhier/ntfy
https://docs.ntfy.sh/install/
https://lindevs.com/install-ntfy-inside-docker-container-in-linux
https://mariushosting.com/how-to-install-ntfy-on-your-synology-nas/
https://wiki.opensourceisawesome.com/books/self-hosted-push-with-ntfysh/page/setupu-ntfysh

## Setup
docker run -d -p 80:80 binwiederhier/ntfy serve

docker run -d --name=ntfy --restart=always \
    -p 8080:80 \
    -v /opt/ntfy/cache:/var/cache/ntfy \
    binwiederhier/ntfy serve --cache-file /var/cache/ntfy/cache.db

### Test
curl -d "Hello Ntfy!" http://p1:8080/test

### Setup 
mkdir -p ~/ntfy-server
cd ~/ntfy-server
nano docker-compose.yml

#################################
version: "2.3"

services:
  ntfy:
    image: binwiederhier/ntfy
    container_name: ntfy-server
    command:
      - serve
    environment:
      - TZ=America/Chicago    # optional: set desired timezone
    volumes:
      - ./var/cache/ntfy:/var/cache/ntfy
      - ./etc/ntfy:/etc/ntfy
    ports:
      - 8150:80
    healthcheck: # optional: remember to adapt the host:port to your environment
        test: ["CMD-SHELL", "wget -q --tries=1 http://localhost:8150/v1/health -O - | grep -Eo '\"healthy\"\\s*:\\s*true' || exit 1"]
        interval: 60s
        timeout: 10s
        retries: 3
        start_period: 40s
    restart: unless-stopped
################


sudo nano ~/ntfy-server/etc/ntfy/server.yml

base-url: "https://ntfyserv.youdomain.com"
upstream-base-url: "https://ntfy.sh"
attachment-cache-dir: "~/docker/ntfy-server/var/cache/ntfy/attachments"

docker compose down
docker compose up -d

curl -d "test" -L https://myserver.mydomain.com/test 