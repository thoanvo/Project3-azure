
$RESOURCE_GROUP_NAME='project3'
$STORAGE_ACCOUNT_NAME="project3$(Get-Random)"
$CONTAINER_NAME='project3'
$LOCATION='australiasoutheast'

# Create resource group
New-AzResourceGroup -Name $RESOURCE_GROUP_NAME -Location $LOCATION

# Create storage account
$storageAccount = New-AzStorageAccount -ResourceGroupName $RESOURCE_GROUP_NAME -Name $STORAGE_ACCOUNT_NAME -SkuName Standard_LRS -Location $LOCATION -AllowBlobPublicAccess $true

# Create blob container
New-AzStorageContainer -Name $CONTAINER_NAME -Context $storageAccount.context -Permission blob

# Get the storage access key
$ACCOUNT_KEY=(Get-AzStorageAccountKey -ResourceGroupName $RESOURCE_GROUP_NAME -Name $STORAGE_ACCOUNT_NAME)[0].value
$env:ARM_ACCESS_KEY=$ACCOUNT_KEY