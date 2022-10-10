# Install the .NET 6.0 SDK on a Raspberry Pi in Two Easy Steps

https://levelup.gitconnected.com/install-the-net-6-0-sdk-on-a-raspberry-pi-in-two-easy-steps-27993c1bd68d

curl -sSL https://dot.net/v1/dotnet-install.sh | bash

Modify .bashrc

export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools