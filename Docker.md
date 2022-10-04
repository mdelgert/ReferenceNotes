# Reference
https://hub.docker.com/search?q=

https://hub.docker.com/

# Commands

```console
PS C:\> docker version
```

[Microsoft SQL Server](https://hub.docker.com/_/microsoft-mssql-server)

```console
PS C:\> docker run --name MSSQL -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=Password2022" -p 1433:1433 -d mcr.microsoft.com/mssql/server:2019-latest
```
