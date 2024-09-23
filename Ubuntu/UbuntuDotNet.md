(https://learn.microsoft.com/en-us/dotnet/core/install/linux-ubuntu#2204)[Install the .NET SDK or the .NET Runtime on Ubuntu]

```console
$ wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
```

```console
$ sudo apt-get update
```

```console
$ sudo apt-get install -y dotnet-runtime-6.0
```

```console
$ dotnet --info
```

```console
$ cd /yourproject/bin/Debug/net6.0
```

```console
$ dotnet yourproject.dll
```
