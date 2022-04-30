# Resource Group
variable "location" {
    type = string
    description = "name of location azure"
}
variable "resource_group_name" {
    type = string
    description = "name of resource group main"
}

#NSG
variable "ip_public" {
    type = string
    description = "IP public of Azure"
}
variable "address_subnet_id" {
    type = string
    description = "ID of subnet"
}

#Image
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

