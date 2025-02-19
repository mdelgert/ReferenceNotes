az containerapp update --name ow1 \
  --resource-group rg-ct1 \
  --add storage \
  --storage-name ct1store1 \
  --azure-file-account-name ct1store1 \
  --azure-file-share-name ct1share \
  --access-mode ReadWrite \
  --mount-path /app/backend/data
