```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
```

https://yourhost:9443