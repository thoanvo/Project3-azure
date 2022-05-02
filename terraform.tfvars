
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
name_image = "VM"
name_vm = "VM-QA"
name_size = "Standard_B1s"
type_storage = "Standard_LRS"
admin_username = "anhpt"
# public key on Window
#public_key_path = "C:/Users/admin/.ssh/id_rsa.pub"
#public key on pipeline
public_key_path = "/home/vsts/work/_temp/id_rsa.pub"

#App
name_app = "App-project3"

#Accounnt
tenant_id       = "69f59580-01e2-4b2d-8c28-571bd28c19f4"
subscription_id = "9036207b-e2a3-4c95-86a9-72f93e74db1d"
client_id       = "55a8e5d9-4cb1-487c-bdee-1c6ba0a24640"
client_secret   = "wvZjs..dFKQicUv5dyAZM32Q4KX~a8D2SQ"
