resource "azurerm_network_security_group" "nsg" {
  name = var.name_nsg
  location = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "rule_access_subnet" {
  name = "Allow Access in Subnet"
  priority = 100
  direction = "Inbound"
  access = "Allow"
  protocol = "tcp"
  source_port_range = "*"
  destination_port_range = "*"
  source_address_prefix = var.address_prefix_subnet
  destination_address_prefix = var.address_prefix_subnet
  resource_group_name = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_network_security_rule" "rule_ssh_vm" {
  name = "Allow SSH VM from IP Admin"
  priority = 101
  direction = "Inbound"
  access = "Allow"
  protocol = "tcp"
  source_port_range = "*"
  destination_port_range = "22"
  source_address_prefix = "${var.myip}/32"
  destination_address_prefix = "*"
  resource_group_name = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name
}
resource "azurerm_subnet_network_security_group_association" "nsg_subnet" {
    subnet_id = var.address_subnet_id
    network_security_group_id = azurerm_network_security_group.nsg.id
}
