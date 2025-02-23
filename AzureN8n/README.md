# Export
az containerapp show \
    --name ca1 \
    --resource-group rg-ce1 \
    --output yaml > secure.yaml

az containerapp show --name ca2 --resource-group rg-ce1 --output yaml > secure.yaml

# Update
az containerapp update \
    --name ca1 \
    --resource-group rg-ce1 \
    --yaml secure.yaml

az containerapp update --name ca2 --resource-group rg-ce1 --yaml secure.yaml