output "n01610736-VNET" {
  value = azurerm_virtual_network.n01610736-VNET.name
}

output "n01610736RG" {
  value = azurerm_virtual_network.n01610736-VNET.resource_group_name
}

output "n01610736-SUBNETID" {
  value = azurerm_subnet.n01610736-SUBNET.id
}

output "n01610736-SUBNETNAME" {
  value = azurerm_subnet.n01610736-SUBNET.name
}

output "n01610736-NSG" {
  value = azurerm_network_security_group.n01610736-NSG.name
}

output "subnet-address-prefixes" {
  value = azurerm_subnet.n01610736-SUBNET.address_prefixes
}

