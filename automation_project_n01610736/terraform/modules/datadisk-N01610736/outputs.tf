output "data_disk_ids" {
  value = azurerm_managed_disk.datadisk-N01610736[*].id
}