# Azure Container Apps: Volume mount fails with "Permission Denied" error
https://learn.microsoft.com/en-us/azure/container-apps/storage-mounts-azure-files?tabs=bash
https://learn.microsoft.com/en-us/answers/questions/1307934/azure-container-apps-volume-mount-fails-with-permi

Manually add volume azure-files-volume with mount options
dir_mode=0777,file_mode=0777,uid=1000,gid=1000,mfsymlinks,nobrl,cache=none

az containerapp show \
    --name openwebui-app1 \
    --resource-group rg-openwebui1 \
    --output yaml > secure.yaml

# Links
https://www.youtube.com/watch?v=Zr63iwQLruk&t=208s
https://www.youtube.com/watch?v=2xCrYkWgHKc&t=1s
https://learn.microsoft.com/en-us/azure/container-apps/storage-mounts-azure-files?tabs=bash
https://github.com/KamalRathnayake/MeetKamalToday./blob/main/94-container-apps-storage-mounts/template-demo.json
