#Resource Group
variable "location" {
    type = string
    description = "name of location azure"
}
variable "resource_group_name" {
    type = string
    description = "name of resource group main"
}
#Network
variable "name_vn" {
    type = string
    description = "name of virtual network"
}
variable "address_cidr" {
  type = string
  description = "The address space that is used the virtual network"
}
variable "address_prefix_subnet" {
    type = string
    description = "Address of subnet"
}
#NSG
variable "name_nsg" {
    type = string
    description = "name of network security group"
}

variable "myip" {
    type = string
    description = "IP public of admin"
}
# variable "ip_public" {
#     type = string
#     description = "IP public of Azure"
# }
#IP public
variable "allocation_method" {
    type = string
    description = "Defines the allocation method for this IP address. Values : Dynamic or Static"
}

##Image
variable "name_image" {
    type = string
    description = "Name of Image"
}

#VM

variable "name_vm" {
    type = string
    description = "name of VM"
}

variable "name_size" {
    type = string
    description = "type size of VM"
}

variable "admin_username" {
    type = string
    description = "name of user admin for VM"
}

variable "type_storage" {
    type = string
    description = "The type of storage to use for the managed disk"
}

variable "public_key_path" {
    type = string
    description = "path of key use for SSH"
}
#APP
variable "name_app" {
  type = string
  description = "Name of app"
}


