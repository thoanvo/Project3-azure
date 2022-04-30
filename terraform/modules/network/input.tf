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
