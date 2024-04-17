resource "azurerm_lb" "loadbalancer-N01610736" {
    name                 = "loadbalancer-N01610736"
    location             = var.location
    resource_group_name  = var.resource_group_name
    sku                  = "Basic"

    frontend_ip_configuration {
      name = "PublicIPAddress"
      public_ip_address_id = azurerm_public_ip.linux_pip.id
    }
    tags = local.common_tags
}
resource "azurerm_public_ip" "linux_pip" {
  name                 = "loadbalancer-N01610736-public-ip"
  location             = var.location
  resource_group_name  = var.resource_group_name
  allocation_method    = "Static"
  sku                  = "Basic"
  tags                 = local.common_tags
  //domain_name_label    = azurerm_lb.loadbalancer-N01610736.name
}

resource "azurerm_lb_backend_address_pool" "lb-backend-address-pool" {
  loadbalancer_id = azurerm_lb.loadbalancer-N01610736.id
  name            = "loadbalancer-N01610736-address_pool"
 
}

resource "azurerm_lb_probe" "probe" {

  loadbalancer_id     = azurerm_lb.loadbalancer-N01610736.id
  name                = "http-probe"
  protocol            = "Http"
  request_path        = "/"
  port                = 80

}

resource "azurerm_lb_rule" "loadbalancer-rules" {
  loadbalancer_id                = azurerm_lb.loadbalancer-N01610736.id
  name                           = "http-rule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.lb-backend-address-pool.id]
  probe_id                       = azurerm_lb_probe.probe.id

}

resource "azurerm_network_interface_backend_address_pool_association" "loadbalancer-nic-backend_pool_association" {
  count                   = var.nb_count
  network_interface_id    = element(var.linux_nic_ids[*], count.index)
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb-backend-address-pool.id
  ip_configuration_name   = element(var.ip-config-names[*], count.index)
  
}