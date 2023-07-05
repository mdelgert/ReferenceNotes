@REM Run shell:startup to add this to startup
@REM Run the following commands one time as admin, must right click compatibility and check "Run as Administrator"
@echo on
echo "Starting Ubuntu"
wsl -d Ubuntu -u root service dbus start
echo "Delete old proxy rules"
C:\Windows\System32\netsh.exe interface portproxy delete v4tov4 listenport=22 listenaddress=0.0.0.0 protocol=tcp
echo "Create new proxy rules"
for /f %%i in ('wsl hostname -I') do set IP=%%i
C:\Windows\System32\netsh.exe interface portproxy add v4tov4 listenport=22 listenaddress=0.0.0.0 connectport=22 connectaddress=%IP%
echo "Delete old firewall rule"
netsh advfirewall firewall delete rule name="OpenSSH Server (sshd) for WSL"
echo "Add windows firewall rule"
New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd) for WSL' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
echo "Done"