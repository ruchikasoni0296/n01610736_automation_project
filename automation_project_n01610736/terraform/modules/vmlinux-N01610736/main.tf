resource "azurerm_availability_set" "linux-availability-set" {
  name                = "${var.linux_name}-linux_avs"
  location            = var.location
  resource_group_name = var.resource_group_name

  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
  tags                         = local.common_tags
}

resource "azurerm_linux_virtual_machine" "linux-vm" {
  count               = var.nb_count
  name                = "${var.linux_name}-${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name
  availability_set_id = azurerm_availability_set.linux-availability-set.id
  network_interface_ids = [element(azurerm_network_interface.linux-nic[*].id, count.index)]
  size                  = var.linux_size

  admin_username                  = var.linux_admin_username
  disable_password_authentication = true


  os_disk {
    name                 = "${var.linux_name}-os-disk-${count.index + 1}"
    caching              = var.linux_os_disk_caching
    storage_account_type = var.linux_os_disk_storage_account_type
    disk_size_gb         = var.linux_os_disk_size
  } 

  source_image_reference {
    publisher = var.os_publisher
    offer     = var.os_offer
    sku       = var.os_sku
    version   = var.os_version
  }
  admin_ssh_key {
    username   = var.linux_admin_username
    public_key = file(var.linux_public_key)
  }

  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }
  tags = local.common_tags
}

resource "azurerm_public_ip" "linux-pip" {
  count               = var.nb_count
  name                = "${var.linux_name}-pip-${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name
  domain_name_label   = "${var.linux_name}-${count.index + 1}"

  allocation_method = "Dynamic"
  tags              = local.common_tags

}

resource "azurerm_network_interface" "linux-nic" {
  count               = var.nb_count
  name                = "${var.linux_name}-nic${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${var.linux_name}-ipconfig-${count.index + 1}"
    subnet_id                     = var.linux_subnet
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.linux-pip[*].id, count.index)
  }
  tags = local.common_tags

}

resource "azurerm_virtual_machine_extension" "network_watcher" {
  count = var.nb_count  

  name                 = "${var.linux_name}-network_watcher-${count.index}"
  virtual_machine_id   = azurerm_linux_virtual_machine.linux-vm[count.index].id

  publisher            = var.publisher_network_watcher
  type                 = var.agent_type_network_watcher
  type_handler_version = "1.4"
  auto_upgrade_minor_version = true

  tags = local.common_tags
}

resource "azurerm_virtual_machine_extension" "azure_monitor" {
  count = var.nb_count

  name                 = "${var.linux_name}-azuremonitor-${count.index}"
  virtual_machine_id   = azurerm_linux_virtual_machine.linux-vm[count.index].id

  publisher            = var.publisher_azure_monitor
  type                 = var.agent_type_azure_monitor
  type_handler_version = "1.6"
  auto_upgrade_minor_version = true

  tags = local.common_tags
}
