#!/bin/bash
RESOURCE_GROUP_NAME=project3
STORAGE_ACCOUNT_NAME=project3$RANDOM
CONTAINER_NAME=project3
LOCATION=australiasoutheast

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location $LOCATION

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY

# Get the storage access key
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)
export ARM_ACCESS_KEY=$ACCOUNT_KEY

echo "RESOURCE_GROUP_NAME : $RESOURCE_GROUP_NAME "
echo "LOCATION : $LOCATION "
echo "STORAGE_ACCOUNT_NAME : $STORAGE_ACCOUNT_NAME "
echo "CONTAINER_NAME : $CONTAINER_NAME"