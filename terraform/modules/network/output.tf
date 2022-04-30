output "name_network" {
  value = azurerm_virtual_network.vn.name
}
output "address_subnet_id" {
  value = azurerm_subnet.subnet.id
}

