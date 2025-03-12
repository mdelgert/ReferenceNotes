RESOURCE_GROUP="rg-ct1"
CONTAINER_APP_ENV="ct1-env"
CT_NAME="ctow1"

az containerapp create --name $CT_NAME \
  --resource-group $RESOURCE_GROUP \
  --environment $CONTAINER_APP_ENV \
  --image ghcr.io/open-webui/open-webui:main \
  --target-port 8080 \
  --ingress external
