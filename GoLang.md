https://phoenixnap.com/kb/debian-install-go
https://www.itzgeek.com/how-tos/linux/debian/how-to-install-go-lang-on-debian-11-debian-10.html

# Debian install
sudo apt update && sudo apt -y
sudo apt install wget
wget https://go.dev/dl/go1.20.2.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.20.2.linux-amd64.tar.gz

# add GoLang to path
nano ~/.profile

# add to last line
export PATH=$PATH:/usr/local/go/bin

# logout and log back into terminal
go version