output "linux_vm_avs" {
  value = azurerm_availability_set.linux-availability-set.name
}

output "virtual_network_name" {
  value = azurerm_network_interface.linux-nic[*].name
}

output "linux-vm" {
  value = {
    ids       = [for vm in azurerm_linux_virtual_machine.linux-vm : vm.id]
    hostnames = [for vm in azurerm_linux_virtual_machine.linux-vm : vm.name]
    nic-ids   = [for vm in azurerm_linux_virtual_machine.linux-vm : vm.network_interface_ids[0]]
    nic-ipconfig-names = [for vm in azurerm_network_interface.linux-nic : vm.ip_configuration[0].name]
  }
}


output "vm_fqdn" {
  value = azurerm_public_ip.linux-pip[*].fqdn
}

output "public_ip" {
  value = azurerm_public_ip.linux-pip[*].ip_address
}

output "private_ip" {
  value = azurerm_network_interface.linux-nic[*].private_ip_address
}

output "linux_nic_ids" {
  value = flatten([
    for vm in azurerm_linux_virtual_machine.linux-vm : vm.network_interface_ids
  ])
}
output "linux_vm_ids" {
  value = azurerm_linux_virtual_machine.linux-vm[*].id
}