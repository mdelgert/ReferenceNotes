az containerapp env storage set \
    --name ct1-env \
    --resource-group rg-ct1 \
    --storage-name ct1store1 \
    --azure-file-account-name ct1store1 \
    --azure-file-account-key "YOURKEY" \
    --azure-file-share-name ow1 \
    --access-mode ReadWrite

