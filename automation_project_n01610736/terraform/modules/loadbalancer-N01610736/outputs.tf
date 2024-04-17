output "loadbalancer_name" {
  value = azurerm_lb.loadbalancer-N01610736[*].name
}

output "loadbalancer_public_ip" {
  value = azurerm_public_ip.linux_pip.ip_address
}