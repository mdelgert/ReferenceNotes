#### Allow Server Running Inside WSL To Be Accessible Outside Windows 10 Host
https://www.nextofwindows.com/allow-server-running-inside-wsl-to-be-accessible-outside-windows-10-host

### Port Forwarding WSL 2 to Your LAN
https://jwstanly.com/blog/article/Port+Forwarding+WSL+2+to+Your+LAN/

### Now open PowerShell as admin.
netsh interface portproxy add v4tov4 listenport=80 listenaddress=0.0.0.0 connectport=80 connectaddress=172.19.50.237

### You can view all forwarded ports with 
netsh interface portproxy show v4tov4

### Drop the port
netsh interface portproxy delete v4tov4 listenport=80 listenaddress=0.0.0.0

The Windows firewall might block these ports. To ensure WSL ports can be reachable, you can make a new inbound firewall rule. Open PowerShell as Administrator and run the following command. Replace -LocalPort with the list/range of ports you need.

New-NetFirewallRule -DisplayName "HTTP" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 80

### Automating with PowerShell
$ports = @(80, 443, 10000, 3000, 5000);

$wslAddress = bash.exe -c "ifconfig eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'"

if ($wslAddress -match '^(\d{1,3}\.){3}\d{1,3}$') {
  Write-Host "WSL IP address: $wslAddress" -ForegroundColor Green
  Write-Host "Ports: $ports" -ForegroundColor Green
}
else {
  Write-Host "Error: Could not find WSL IP address." -ForegroundColor Red
  exit
}

$listenAddress = '0.0.0.0';

foreach ($port in $ports) {
  Invoke-Expression "netsh interface portproxy delete v4tov4 listenport=$port listenaddress=$listenAddress";
  Invoke-Expression "netsh interface portproxy add v4tov4 listenport=$port listenaddress=$listenAddress connectport=$port connectaddress=$wslAddress";
}

$fireWallDisplayName = 'WSL Port Forwarding';
$portsStr = $ports -join ",";

Invoke-Expression "Remove-NetFireWallRule -DisplayName $fireWallDisplayName";
Invoke-Expression "New-NetFireWallRule -DisplayName $fireWallDisplayName -Direction Outbound -LocalPort $portsStr -Action Allow -Protocol TCP";
Invoke-Expression "New-NetFireWallRule -DisplayName $fireWallDisplayName -Direction Inbound -LocalPort $portsStr -Action Allow -Protocol TCP";