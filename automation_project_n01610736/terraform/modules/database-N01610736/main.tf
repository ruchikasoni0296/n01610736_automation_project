resource "azurerm_postgresql_server" "database-N01610736" {
    name                         = var.database_name
    location                     = var.location
    resource_group_name          = var.resource_group_name
    sku_name                     = var.sku_name
    version                      = var.vers
    administrator_login          = var.administrator_login
    administrator_login_password = var.administrator_login_password
    ssl_enforcement_enabled      = var.ssl_enforcement_enabled 
}

/*
resource "azurerm_postgresql_server" "database_instance" {
  name                         = var.database_name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  sku_name                     = var.sku_name
  version                      = var.vers
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  ssl_enforcement_enabled      = var.ssl_enforcement_enabled

}
*/



