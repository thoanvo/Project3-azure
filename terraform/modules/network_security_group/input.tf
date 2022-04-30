# Resource Group
variable "location" {
    type = string
    description = "name of location azure"
}
variable "resource_group_name" {
    type = string
    description = "name of resource group main"
}
#Network
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
variable "ip_public" {
    type = string
    description = "IP public of Azure"
}
variable "address_subnet_id" {
    type = string
    description = "ID of subnet"
}
