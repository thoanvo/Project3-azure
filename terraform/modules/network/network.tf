resource "azurerm_virtual_network" "vn" {
  name = var.name_vn
  location = var.location
  resource_group_name = var.resource_group_name
  address_space = [var.address_cidr]
}

resource "azurerm_subnet" "subnet" {
  name = "${var.name_vn}-subnet"
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vn.name
  address_prefixes = [var.address_prefix_subnet]
}