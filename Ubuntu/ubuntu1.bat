::Using WSL as regular Linux host on same network with 10 gigabit and NFS
::https://blog.sunsaturn.com/linux/using-wsl-as-regular-linux-host-on-same-network-with-10-gigabit-and-nfs/

@ECHO OFF
:: Start WSL in background
TITLE Starting WSL

:: Section 1: Starting WSL in background
set OS=Ubuntu-22.04
ECHO ==========================
ECHO Starting WSL %OS% in background, please wait...
ECHO ============================

wsl -d %OS% --exec dbus-launch true

:: Section 2: Start SSH service in WSL
ECHO ==========================
ECHO Starting SSH service in WSL %OS%
ECHO ============================

wsl -d %OS% --exec sudo service ssh start

ECHO ==========================
ECHO WSL and SSH service started.
ECHO ==========================
