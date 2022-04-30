output "ip_public" {
  value = azurerm_public_ip.ip_public.ip_address
}
output "ip_public_id" {
  value = azurerm_public_ip.ip_public.id
}