
https://chocolatey.org/install

https://community.chocolatey.org/packages

# Setup
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Packages
choco install git -y

choco install github-desktop -y

choco install 7zip -y

choco install notepadplusplus.install -y

choco install crystaldiskmark -y

choco install crystaldiskinfo -y

choco install microsoft-windows-terminal -y

choco install postman -y

choco install googlechrome -y

choco install lastpass -y

choco install sql-server-management-studio -y

choco install docker-desktop -y

choco install jetbrainstoolbox -y

choco install firefox -y

choco install vscode -y

choco install rdiff-backup -y

choco install veeam-endpoint-backup-free -y

choco install vnc-viewer -y

choco install shutup10 -y

choco install slack -y
