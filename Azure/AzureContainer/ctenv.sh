# Variables
RESOURCE_GROUP="rg-ct1"
LOCATION="eastus"
CONTAINER_APP_ENV="ct1-env"

# Create Resource Group
az group create --name $RESOURCE_GROUP --location $LOCATION

# Create Container App Environment
az containerapp env create \
    --name $CONTAINER_APP_ENV \
    --resource-group $RESOURCE_GROUP \
    --location $LOCATION
