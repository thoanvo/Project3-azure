resource "azurerm_public_ip" "ip_public" {
  name = "Pub-IP"
  resource_group_name = var.resource_group_name
  allocation_method = var.allocation_method
  location = var.location
}
