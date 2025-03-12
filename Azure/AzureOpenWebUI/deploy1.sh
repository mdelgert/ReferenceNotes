# Variables
RESOURCE_GROUP="rg-openwebui1"
LOCATION="eastus"
CONTAINER_APP_ENV="openwebui-env1"
STORAGE_NAME="openwebuiblobstorage1"
STORAGE_SHARE="openwebuishare1"
CONTAINER_APP="openwebui-app1"

# Create Resource Group
# az group create --name $RESOURCE_GROUP --location $LOCATION

# # Create Container App Environment
# az containerapp env create \
#     --name $CONTAINER_APP_ENV \
#     --resource-group $RESOURCE_GROUP \
#     --location $LOCATION

# Create Storage Account
az storage account create --name $STORAGE_NAME \
  --resource-group $RESOURCE_GROUP \
  --location $LOCATION \
  --sku Standard_LRS

# Create Storage Share
az storage share create --name $STORAGE_SHARE \
  --account-name $STORAGE_NAME
