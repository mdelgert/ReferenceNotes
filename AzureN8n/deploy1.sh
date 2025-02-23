# Variables
RESOURCE_GROUP="rg-ce1"
CONTAINER_APP="ca3"

# Create Container App Environment
az containerapp create \
  --name $CONTAINER_APP \
  --resource-group $RESOURCE_GROUP \
  --yaml n8n.yaml