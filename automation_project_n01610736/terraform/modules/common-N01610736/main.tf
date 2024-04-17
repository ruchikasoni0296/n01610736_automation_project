resource "azurerm_log_analytics_workspace" "n01610736-LAW" {
    name                = var.law_name
    location            = var.location
    resource_group_name = var.resource_group
    sku                 = var.law_sku
     
    tags = local.common_tags
    
}

resource "azurerm_recovery_services_vault" "n01610736-RSV" {
    name                = var.rsv_name
    location            = var.location
    resource_group_name = var.resource_group
    sku                 = var.rsv_sku
    
    tags = local.common_tags
  
}

resource "azurerm_storage_account" "n01610736-sa" {
    name                        = var.sa_name
    resource_group_name         = var.resource_group
    location                    = var.location
    account_tier                = "Standard"
    account_replication_type    = "LRS"
}