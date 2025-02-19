az login
az account set --subscription "YOUR_SUBSCRIPTION_NAME_OR_ID"

az containerapp env list --resource-group rg-ct1

# Export the config
az containerapp show \
    --name ow1 \
    --resource-group rg-ct1 \
    --output yaml > ow1.yaml


# Update config
az containerapp update \
    --name ow1 \
    --resource-group rg-ct1 \
    --yaml ow1.yaml

template:
  containers:
    - image: ghcr.io/open-webui/open-webui:main
      name: ow1
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
