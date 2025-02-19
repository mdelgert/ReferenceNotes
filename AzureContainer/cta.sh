az container create \
    --resource-group rg-ct1 \
    --name open-webui \
    --image ghcr.io/open-webui/open-webui:main \
    --ports 8080 \
    --azure-file-volume-account-name ct1store1 \
    --azure-file-volume-account-key "YOURKEY" \
    --azure-file-volume-share-name ow1 \
    --azure-file-volume-mount-path /app/backend/data \
    --os-type Linux \
    --restart-policy Always \
    --cpu 2 \
    --memory 4
