# Resource Group
variable "location" {
    type = string
    description = "name of location azure"
}
variable "resource_group_name" {
    type = string
    description = "name of resource group main"
}
#IP public
variable "allocation_method" {
    type = string
    description = "Defines the allocation method for this IP address. Values : Dynamic or Static"
}
