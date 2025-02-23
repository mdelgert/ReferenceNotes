https://learn.microsoft.com/en-us/azure/storage/blobs/blobfuse2-how-to-deploy?tabs=Ubuntu
https://learn.microsoft.com/en-us/azure/storage/blobs/blobfuse2-configuration
https://github.com/Azure/azure-storage-fuse/blob/main/setup/baseConfig.yaml

sudo wget https://packages.microsoft.com/config/ubuntu/24.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install libfuse3-dev fuse3
sudo apt-get install blobfuse2
systemctl daemon-reload