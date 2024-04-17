resource "azurerm_virtual_network" "n01610736-VNET" {
  name                = var.vnet_name
  address_space       = var.vnet_space
  location            = var.location
  resource_group_name = var.n01610736RG
}

resource "azurerm_subnet" "n01610736-SUBNET" {
  name                     = var.n01610736-SUBNET
  virtual_network_name     = azurerm_virtual_network.n01610736-VNET.name
  resource_group_name      = var.resource_group_name
  address_prefixes         = var.subnet_space
}

resource "azurerm_network_security_group" "n01610736-NSG" {
  name                     = var.n01610736-NSG
  location                 = var.location
  resource_group_name      = var.resource_group_name

  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "rule2"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "rule3"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5985"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "rule4"
    priority                   = 400
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = local.common_tags
}

resource "azurerm_subnet_network_security_group_association" "humber_subnet_nsg_association" {
  subnet_id                 = azurerm_subnet.n01610736-SUBNET.id
  network_security_group_id = azurerm_network_security_group.n01610736-NSG.id
}