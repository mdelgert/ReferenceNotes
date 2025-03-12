az login
az account set --subscription "YOUR_SUBSCRIPTION_NAME_OR_ID"

az containerapp env list --resource-group rg-ct1

# Azure Container Apps: Volume mount fails with "Permission Denied" error
https://learn.microsoft.com/en-us/azure/container-apps/storage-mounts-azure-files?tabs=bash
https://learn.microsoft.com/en-us/answers/questions/1307934/azure-container-apps-volume-mount-fails-with-permi

# Export the config
az containerapp show \
    --name ctow1 \
    --resource-group rg-ct1 \
    --output yaml > secure.yaml

# Update config
az containerapp update \
    --name ctow1 \
    --resource-group rg-ct1 \
    --yaml secure.yaml

template:
  containers:
    - image: ghcr.io/open-webui/open-webui:main
      name: ctow1
      resources:
        cpu: 0.5
        ephemeralStorage: 2Gi
        memory: 1Gi
      volumeMounts:
        - volumeName: ct1store1
          mountPath: /app/backend/data
  volumes:
    - name: ct1store1
      storageType: AzureFile
      storageName: ct1store1

# Show config 
az containerapp show -n ow1 -g rg-ct1 -o yaml

az containerapp show \
    --name ow1 \
    --resource-group rg-ct1 \
    --output yaml > secure.yaml