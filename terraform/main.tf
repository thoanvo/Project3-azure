### Provider
terraform {
    required_providers {
      azurerm = {
        source  = "hashicorp/azurerm"
        version = "=2.97.0"
      }
    }
    backend "azurerm" {
        resource_group_name = "project3"
        storage_account_name = "project38286"
        container_name = "project3"
        key = "terraform.tfstate"
    }
}
provider "azurerm" {
    tenant_id       = "${var.tenant_id}"
    subscription_id = "${var.subscription_id}"
    client_id       = "${var.client_id}"
    client_secret   = "${var.client_secret}"
  features {}
}
## Resource group

module "resource_group" {
  source = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  #location = var.location
}

## Network and subnet
module "network"{
  source = "./modules/network"
  name_vn = var.name_vn
  address_cidr = var.address_cidr
  location = var.location
  resource_group_name = module.resource_group.resource_group_name
  address_prefix_subnet = var.address_prefix_subnet
}
## IP Public
module "ip_public"{
  source = "./modules/IP_public"
  allocation_method = var.allocation_method
  location = var.location
  resource_group_name = module.resource_group.resource_group_name
}

## NSG
module "nsg" {
  source = "./modules/network_security_group"
  name_nsg = var.name_nsg
  location = var.location
  resource_group_name = module.resource_group.resource_group_name
  address_prefix_subnet = var.address_prefix_subnet
  myip = var.myip
  ip_public = module.ip_public.ip_public
  depends_on = [module.vm.ne]
  address_subnet_id = module.network.address_subnet_id

}

#VM
module "vm" {
  source = "./modules/VM"
  location = var.location
  resource_group_name = module.resource_group.resource_group_name
  name_image = var.name_image
  name_vm = var.name_vm
  address_subnet_id = module.network.address_subnet_id
  ip_public = module.ip_public.ip_public_id
  name_size = var.name_size
  admin_username = var.admin_username
  type_storage = var.type_storage
  public_key_path = var.public_key_path
  depends_on = [
    module.ip_public,module.network
  ]
}

#APP
module "app" {
  source = "./modules/App"
  location = var.location
  resource_group_name = module.resource_group.resource_group_name
  name_app = var.name_app
}




# resource "azurerm_resource_group" "state-demo-secure" {
#   name     = "state-demo"
#   location = "eastus"
# }

