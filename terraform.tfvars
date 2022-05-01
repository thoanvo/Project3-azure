
# Resource group
location = "australiasoutheast"
resource_group_name = "project3"
# Network subnet
name_vn = "NetworkMainCIDR"
address_cidr = "10.0.0.0/16"
address_prefix_subnet = "10.0.1.0/24"
#NSG
myip = "118.71.11.255"
allocation_method = "Dynamic"
name_nsg = "NSG-subnet"
#VM
name_image = "image_VM"
name_vm = "VM-QA"
name_size = "Standard_B1s"
type_storage = "Standard_LRS"
admin_username = "anhpt"
# public key on Window
public_key_path = "~/.ssh/id_rsa.pub"

#App
name_app = "App-project3"

#Accounnt
tenant_id       = "69f59580-01e2-4b2d-8c28-571bd28c19f4"
subscription_id = "9036207b-e2a3-4c95-86a9-72f93e74db1d"
client_id       = "9b09ec87-8bb6-4e34-a3f0-f54f5e1a7b1e"
client_secret   = "lj4BBx9.yN9f~4W.~fbqwLqTjeCBqdUF2I"
