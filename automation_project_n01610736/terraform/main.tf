module "rgroup-N01610736" {
  source                              = "./modules/rgroup-N01610736"

  n01610736RG                         = "n01610736-RG"
  location                            = "Canada Central"
}

module "network-N01610736" {
  source                              = "./modules/network-N01610736"

  n01610736RG                         = module.rgroup-N01610736.n01610736RG
  location                            = module.rgroup-N01610736.location
  resource_group_name                 = module.rgroup-N01610736.n01610736RG
  n01610736-SUBNET                    = var.subnet_name
} 

module "common-N01610736" {
  source                              = "./modules/common-N01610736"

  location                            = module.rgroup-N01610736.location
  resource_group                      = module.rgroup-N01610736.n01610736RG
}


module "vmlinux-N01610736" {
  source                              = "./modules/vmlinux-N01610736"

  location                            = module.rgroup-N01610736.location
  linux_subnet                        = module.network-N01610736.n01610736-SUBNETID
  storage_account_uri                 = module.common-N01610736.storage_account-primary_blob_endpoint
  resource_group_name                 = module.rgroup-N01610736.n01610736RG
  linux_avs                           = var.avs_name
  linux_name                          = "n01610736-u-vm"
  linux_size                          = "Standard_B1s"
  linux_admin_username                = "n01610736ruchika"
  linux_public_key                    = "/home/n01610736ruchika/.ssh/id_rsa.pub"  
  linux_private_key                   = "/home/n01610736ruchika/.ssh/id_rsa"
  nb_count                            = 3
}      

module "vmwindows-N01610736" {
  source                              = "./modules/vmwindows-N01610736"

  windows_avs                         = var.windows_avs
  location                            = module.rgroup-N01610736.location
  resource-group-windows-name         = "n01610736-w-vm"
  resource-group-windows-loc          = module.rgroup-N01610736.location
  windows_name                        = "n01610736-w-vm"
  windows_admin_username              = "n01610736winruchika"
  windows_admin_password              = "01610736@Winuser"
  windows_vm_size                     = "Standard_B1s"
  windows-network-subnet              = module.network-N01610736.n01610736-SUBNETID
  nb_count                            = 1
}

module "datadisk-N01610736" {
  source                              = "./modules/datadisk-N01610736"

  location                            = module.rgroup-N01610736.location
  resource_group_name                 = "n01610736-w-vm"
  data_disk_type                      = "StandardSSD_LRS" 
  data_disk_size                      = 10
  linux_virtual_machine_ids           = module.vmlinux-N01610736.linux_vm_ids
  windows_virtual_machine_ids         = module.vmwindows-N01610736.windows_vm_ids
  virtual_machine_ids                 = concat(module.vmlinux-N01610736.linux_vm_ids,module.vmwindows-N01610736.windows_vm_ids)
}

module "database-N01610736" {
  source                              = "./modules/database-N01610736"

  location                            = module.rgroup-N01610736.location
  resource_group_name                 = module.rgroup-N01610736.n01610736RG
  database_name                       = "n01610736-database"
  administrator_login                 = "adminuser"
  administrator_login_password        = "P@ssw0rd"
  ssl_enforcement_enabled             = true
}

module "loadbalancer-N01610736" {
  source                              = "./modules/loadbalancer-N01610736"

  location                            = module.rgroup-N01610736.location
  resource_group_name                 = "n01610736-u-vm"
  nb_count                            = 3  
  linux_nic_ids	                      =	module.vmlinux-N01610736.linux_nic_ids
  linux_name                          = module.vmlinux-N01610736.linux-vm.hostnames 
  ip-config-names                     = module.vmlinux-N01610736.linux-vm.nic-ipconfig-names
}
