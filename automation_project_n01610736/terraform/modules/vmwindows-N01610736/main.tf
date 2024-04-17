resource "azurerm_availability_set" "windows-availability-set" {
  name                          = var.windows_avs
  location                      = var.resource-group-windows-loc
  resource_group_name           = var.resource-group-windows-name

  platform_fault_domain_count   = 2
  platform_update_domain_count  = 5
  tags                          = local.common_tags
}

resource "azurerm_public_ip" "windows-pip" {
  count               = var.nb_count
  name                = "${count.index}-pip"
  location            = var.resource-group-windows-loc
  resource_group_name = var.resource-group-windows-name
  domain_name_label   = "n01610736-dn-${format(count.index + 1)}"

  allocation_method   = "Static"
  tags                = local.common_tags

}

resource "azurerm_network_interface" "windows-nic" {
  count               = var.nb_count
  name                = "${var.windows_name}-nic-${count.index}"
  location            = var.location
  resource_group_name = var.resource-group-windows-name

  ip_configuration {
    name                          = "${var.windows_name}-ipconfig-${count.index + 1}"
    subnet_id                     = var.windows-network-subnet
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.windows-pip[*].id, count.index)
  }
  tags = local.common_tags
 
}

resource "azurerm_windows_virtual_machine" "windows-vm" {
  count                 = var.nb_count

  name                  = var.windows_name
  computer_name         = var.windows_name
  location              = var.resource-group-windows-loc
  resource_group_name   = var.resource-group-windows-name

  admin_username        = var.windows_admin_username
  admin_password        = var.windows_admin_password
  network_interface_ids = [azurerm_network_interface.windows-nic[count.index].id]
  size                  = var.windows_vm_size

  os_disk {
    name                  = "${var.windows_name}-os-disk-${count.index + 1}"
    caching               = var.windows_disk_caching
    storage_account_type  = var.windows_storage_account_type
    disk_size_gb          = var.windows_disk_size
  }

  source_image_reference {
    publisher = var.windows_publisher
    offer     = var.windows_offer
    sku       = var.windows_sku
    version   = var.windows_version
  }
  winrm_listener {
    protocol = "Http"
  }

  tags = local.common_tags

}

resource "azurerm_virtual_machine_extension" "antimalware" {
  count               = var.nb_count

  name                 = "${var.windows_name}-antimalware-${count.index}"
  virtual_machine_id   =  element(azurerm_windows_virtual_machine.windows-vm[*].id, count.index)
                          
  publisher            = "Microsoft.Azure.Security"
  type                 = "IaaSAntimalware"
  type_handler_version = "1.3"
  auto_upgrade_minor_version = true

  tags = local.common_tags
}
