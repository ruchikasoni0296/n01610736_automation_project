output "log_analytics_workspace_name" {
  value = azurerm_log_analytics_workspace.n01610736-LAW.name
}

output "recovery_service_vault_name" {
  value = azurerm_recovery_services_vault.n01610736-RSV.name
}

output "storage_account_name" {
  value = azurerm_storage_account.n01610736-sa.name
}

output "storage_account-primary_blob_endpoint" {
  value = azurerm_storage_account.n01610736-sa.primary_blob_endpoint
}