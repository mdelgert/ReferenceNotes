# Links
https://www.youtube.com/watch?v=Zr63iwQLruk&t=208s
https://www.youtube.com/watch?v=2xCrYkWgHKc&t=1s
https://learn.microsoft.com/en-us/azure/container-apps/storage-mounts-azure-files?tabs=bash
https://github.com/KamalRathnayake/MeetKamalToday./blob/main/94-container-apps-storage-mounts/template-demo.json

# AI Server
https://api.groq.com/openai/v1

# Add Google PSE
https://programmablesearchengine.google.com/controlpanel/all
https://developers.google.com/custom-search/v1/introduction

# Add Groc
https://github.com/open-webui/open-webui/discussions/974
https://www.youtube.com/watch?v=qOxsIlpIMt4

# Azure Container Apps: Volume mount fails with "Permission Denied" error
https://learn.microsoft.com/en-us/azure/container-apps/storage-mounts-azure-files?tabs=bash
https://learn.microsoft.com/en-us/answers/questions/1307934/azure-container-apps-volume-mount-fails-with-permi

Manually add volume azure-files-volume with mount options
dir_mode=0777,file_mode=0777,uid=1000,gid=1000,mfsymlinks,nobrl,cache=none

# Export
az containerapp show \
    --name ca1 \
    --resource-group rg-ce1 \
    --output yaml > secure.yaml

<<<<<<< HEAD:AzureOpenWebUI/Readme.md
# Links
https://blakedrumm.com/blog/azure-container-apps-openweb-ui/
https://www.youtube.com/watch?v=Zr63iwQLruk&t=208s
https://www.youtube.com/watch?v=2xCrYkWgHKc&t=1s
https://learn.microsoft.com/en-us/azure/container-apps/storage-mounts-azure-files?tabs=bash
https://github.com/KamalRathnayake/MeetKamalToday./blob/main/94-container-apps-storage-mounts/template-demo.json
=======
az containerapp show --name ca1 --resource-group rg-ce1 --output yaml > secure.yaml

# Update
az containerapp update \
    --name ca1 \
    --resource-group rg-ce1 \
    --yaml secure.yaml

az containerapp update --name ca1 --resource-group rg-ce1 --yaml secure.yaml



>>>>>>> 194f70d7a677a94fe58e84ebd50596ec96c010b2:AzureOpenWebUI/README.md
