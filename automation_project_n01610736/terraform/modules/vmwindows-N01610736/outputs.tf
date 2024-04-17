output "windows_vm_hostname" {
  value = [for i in range(length(azurerm_windows_virtual_machine.windows-vm)) : azurerm_windows_virtual_machine.windows-vm[i].name]
}

output "windows_vm_fqdn" {
    value = [for i in range(length(azurerm_public_ip.windows-pip)) : azurerm_public_ip.windows-pip[i].fqdn]
}

output "windows_private_ip" {
    value = [for i in range(length(azurerm_windows_virtual_machine.windows-vm)) : azurerm_windows_virtual_machine.windows-vm[i].private_ip_address]
}

output "windows_public_ip" {
    value = [for i in range(length(azurerm_windows_virtual_machine.windows-vm)) : azurerm_windows_virtual_machine.windows-vm[i].public_ip_address]
}

output "windows_availability_set_name" {
    value = azurerm_availability_set.windows-availability-set.name
}

output "virtual_network_name" {
  value = [for i in range(length(azurerm_network_interface.windows-nic)) : azurerm_network_interface.windows-nic[i].name]
}

output "windows_vm_ids" {
  value = azurerm_windows_virtual_machine.windows-vm[*].id
}
