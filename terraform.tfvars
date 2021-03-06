
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
tenant_id       = "value4"
subscription_id = "value"
client_id       = "value"
client_secret   = "value"
