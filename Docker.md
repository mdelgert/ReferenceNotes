# Reference
https://hub.docker.com/search?q=
https://hub.docker.com/
https://github.com/docker
https://github.com/docker/getting-started
https://devopscube.com/build-docker-image/

# Commands

```console
docker version
```

[Microsoft SQL Server](https://hub.docker.com/_/microsoft-mssql-server)

```console
docker run --name MSSQL -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=Password2022" -p 1433:1433 -d mcr.microsoft.com/mssql/server:2019-latest
```

https://www.cloudiqtech.com/install-run-sql-server-docker-container-mac/
https://medium.com/geekculture/docker-express-running-a-local-sql-server-on-your-m1-mac-8bbc22c49dc9

```console
docker run --name MSSQL -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=Password2022" -p 1433:1433 -d mcr.microsoft.com/azure-sql-edge
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