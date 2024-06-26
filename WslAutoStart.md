# Links
https://blog.sunsaturn.com/linux/using-wsl-as-regular-linux-host-on-same-network-with-10-gigabit-and-nfs/
https://randombytes.substack.com/p/bridged-networking-under-wsl
https://learn.microsoft.com/en-us/answers/questions/73672/(ubuntu-on-the-wsl2)-fixed-mac-address-with-availa
https://github.com/microsoft/WSL/issues/5352
https://github.com/microsoft/WSL/issues/11494
https://github.com/kenvix/WSLAttachSwitchEx
https://stackoverflow.com/questions/64569262/is-it-possible-to-make-wsl-virtual-switch-external-in-windows-20h2-wsl2-0-an
https://github.com/microsoft/WSL/issues/5835
https://github.com/microsoft/WSL/issues/4150
https://www.browserling.com/tools/random-mac

# Example 1 main .wslconfig C:\home\Users\username\.wslconfig 
[wsl2]
vmIdleTimeout=-1
networkingMode = bridged
#networkingMode=mirrored
vmSwitch = "WSL Bridge"
ipv6=true

# Example 2
[wsl2]
kernelCommandLine=ipv6.disable=1
memory=16GB
swap=0
guiApplications=true
debugConsole=false
#vmIdleTimeout=-1
networkingMode=bridged
vmSwitch=WSLBridged
dhcp=false
macAddress=0E:00:00:00:00:00
ipv6=false

[experimental]
autoMemoryReclaim=gradual

# Example 3
[wsl2]
vmIdleTimeout=-1
networkingMode=bridged
vmSwitch=WSLB
macAddress=0E:00:00:00:00:00
ipv6=false
kernelCommandLine=ipv6.disable=1

# Example mac addresses (if lower case throws error)
C2:69:F3:8E:EA:EC
11:A1:82:6E:CF:8E
D6:3D:DC:26:FE:59
C3:4D:59:13:CC:79
AE:B6:F6:4B:1E:AE
D3:8C:2C:8C:2B:19
B0:96:4C:0E:11:9A


# Example client .wslconfig /etc/wsl.conf
[boot]
systemd=true
#command = ip link add bond0 address 00:15:5d:e1:cf:3f type bond

[network]
hostname = u1
generateHosts = false

```bash
sudo cp /etc/resolv.conf /etc/resolv.conf.old
sudo nano /etc/hosts
sudo apt install openssh-server net-tools
sudo service ssh start
```

# Check ip address
```bash
ip address
```

# Example
# This file was automatically generated by WSL. To stop automatic generatio>
# [network]
# generateHosts = false
127.0.0.1       localhost
127.0.1.1       u1.     u1

```ps
wsl --shutdown
```