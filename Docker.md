# How to Monitor Container Memory and CPU Usage in Docker Desktop
docker stats

# Raspberry Pi & Docker Monitoring
https://github.com/oijkn/Docker-Raspberry-PI-Monitoring

# Top Docker Monitoring Tools
https://code-maze.com/top-docker-monitoring-tools/
https://hub.docker.com/r/google/cadvisor/

# Monitor your Raspberry Pi cluster with Prometheus
https://blog.alexellis.io/prometheus-nodeexporter-rpi/

# Samba file server for Raspberry Pi
https://hub.docker.com/r/trnape/rpi-samba
https://bitbucket.org/trnape/rpi-samba/src/master/
https://gist.github.com/atanasyanew/5e1e5ba1af658aab5cd4f965919559ac
https://github.com/alexandreroman/rpi-samba
https://linuxfun.org/en/2022/01/21/how-to-setup-samba-server-on-raspberry-pi-en/
https://github.com/fschuindt/docker-smb
https://blog.pistack.co.za/samba-server-on-raspberry-pi-with-docker/

# OpenMediaVault Docker Container
https://hub.docker.com/r/ikogan/openmediavault/tags
https://www.truenas.com/freenas/
https://hub.docker.com/r/ablyler/freenas-provisioner
https://hub.docker.com/r/travisghansen/freenas-iscsi-provisioner
https://hub.docker.com/r/phh700/openmediavault-armv8
https://hub.docker.com/r/cedricdelpas/openmediavault

docker run --name OpenMediaVault -d -ti -h openmediavault -v /home/mdelgert/data:/data:Z -P cedricdelpas/openmediavault

# How to setup an ssh server within a docker container
https://dev.to/s1ntaxe770r/how-to-setup-ssh-within-a-docker-container-i5i
https://www.techrepublic.com/article/deploy-docker-container-ssh-access/
https://mtabishk999.medium.com/how-to-enable-ssh-within-a-docker-container-511260a70cce

# Containerize an application
https://docs.docker.com/get-started/02_our_app/

git clone https://github.com/docker/getting-started.git
docker build -t getting-started .
docker run -d -p 80:80 getting-started

Or pull from docker hub
docker run -d -p 80:80 docker/getting-started --restart=always

# Or simple test from docker
docker run -d -p 80:80 docker/getting-started
http://localhost/tutorial/

# Install Docker on Windows (WSL) without Docker Desktop
https://dev.to/bowmanjd/install-docker-on-windows-wsl-without-docker-desktop-34m9

# https://nickjanetakis.com/blog/install-docker-in-wsl-2-without-docker-desktop
# https://github.com/nickjj?tab=repositories&q=docker-*-example
# Install Docker, you can ignore the warning from Docker about using WSL
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Add your user to the Docker group
sudo usermod -aG docker $USER

# Sanity check that both tools were installed successfully
docker --version
docker compose version

# Using Ubuntu 22.04 or Debian 10 / 11? You need to do 1 extra step for iptables
# compatibility, you'll want to choose option (1) from the prompt to use iptables-legacy.
sudo update-alternatives --config iptables

# Commands

```console
docker version
```

[Microsoft SQL Server](https://hub.docker.com/_/microsoft-mssql-server)

```console
docker run --name MSSQL -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=Password2023" -p 1434:1433 -d mcr.microsoft.com/mssql/server:2022-latest
```

```console
docker run --name MSSQL -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=Password2023" -p 1434:1433 -d mcr.microsoft.com/mssql/server:2019-CU14-ubuntu-20.04
```

```console
docker run --name MSSQL -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=Password2023" -p 1434:1433 -d mcr.microsoft.com/mssql/server:2019-latest
```

https://www.cloudiqtech.com/install-run-sql-server-docker-container-mac/
https://medium.com/geekculture/docker-express-running-a-local-sql-server-on-your-m1-mac-8bbc22c49dc9

```console
docker run --name MSSQL -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=Password2023" -p 1434:1433 -d mcr.microsoft.com/azure-sql-edge
```

```console
docker start MSSQL
```

```console
docker stop MSSQL
```

# Images
https://lynxbee.com/how-to-run-ubuntu-18-04-in-docker-container/#.Yz71E3bMJD8
https://hub.docker.com/_/ubuntu

```console
docker pull ubuntu
```

```console
docker run --name ubuntuTest 
```

# How to Launch a Docker Container with an Interactive Shell
https://www.letscloud.io/community/how-to-launch-a-docker-container-with-an-interactive-shell

docker run --name test -d ubuntu

docker run -i -t ubuntu bash

docker run --name test -p 22:22 -i -t ubuntu bash

# How to setup an ssh server within a docker container
https://dev.to/s1ntaxe770r/how-to-setup-ssh-within-a-docker-container-i5i

# How to deploy a Docker container with SSH access
https://www.techrepublic.com/article/deploy-docker-container-ssh-access/
https://dev.to/s1ntaxe770r/how-to-setup-ssh-within-a-docker-container-i5i
https://docs.docker.com/compose/extends/
https://docs.docker.com/get-started/02_our_app/
https://dev.to/natterstefan/docker-tip-how-to-get-host-s-ip-address-inside-a-docker-container-5anh

# Reference
https://hub.docker.com/search?q=
https://hub.docker.com/
https://github.com/docker
https://github.com/docker/getting-started
https://devopscube.com/build-docker-image/