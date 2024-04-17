output "resource_group_name" {
  value = module.rgroup-N01610736.n01610736RG
}

output "location" {
  value = module.rgroup-N01610736.location
}

output "vnet-name" {
  value = module.network-N01610736.n01610736-VNET
}

output "subnet-name" {
  value = module.network-N01610736.n01610736-SUBNETNAME
}

output "subnet-address-prefixes" {
  value = module.network-N01610736.subnet-address-prefixes
}

output "nsg-name" {
  value = module.network-N01610736.n01610736-NSG
}

output "linux_vm_avs" {
  value = module.vmlinux-N01610736.linux_vm_avs
}

output "linux_virtual_network_name" {
  value = module.vmlinux-N01610736.virtual_network_name
}

output "linux_vm_hostname" {
  value = module.vmlinux-N01610736.linux-vm.hostnames
}

output "linux_vm_fqdn" {
  value = module.vmlinux-N01610736.vm_fqdn
}

output "linux_public_ip" {
  value = module.vmlinux-N01610736.public_ip
}

output "linux_private_ip" {
  value = module.vmlinux-N01610736.private_ip
}

output "windows_vm_hostname" {
  value = module.vmwindows-N01610736.windows_vm_hostname
}

output "windows_vm_fqdn" {
  value = module.vmwindows-N01610736.windows_vm_fqdn
}

output "windows_private_ip" {
  value = module.vmwindows-N01610736.windows_private_ip
}

output "windows_public_ip" {
  value = module.vmwindows-N01610736.windows_public_ip
}

output "windows_vm_avs" {
  value = module.vmwindows-N01610736.windows_availability_set_name
}

output "windows_virtual_network_name" {
  value = module.vmwindows-N01610736.virtual_network_name
}

output "loadbalancer_public_ip" {
  value = module.loadbalancer-N01610736.loadbalancer_public_ip
}

output "loadbalancer_name" {
  value = module.loadbalancer-N01610736.loadbalancer_name
}

output "database_instance_name" {
  value = module.database-N01610736.database_instance_name
}

output "log_analytics_workspace_name" {
  value = module.common-N01610736.log_analytics_workspace_name
}

output "recovery_services_vault_name" {
  value = module.common-N01610736.recovery_service_vault_name
}

output "storage_account_name" {
  value = module.common-N01610736.storage_account_name
}

output "storage_account_primary_blob_endpoint" {
  value = module.common-N01610736.storage_account-primary_blob_endpoint
}

output "datadisk_name" {
  value = module.datadisk-N01610736.data_disk_ids
}