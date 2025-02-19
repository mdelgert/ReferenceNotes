az storage account create --name ct1store1 \
  --resource-group rg-ct1 \
  --location eastus \
  --sku Standard_LRS

az storage share create --name ct1share \
  --account-name ct1store1
