locals {
  common_tags = {
    Assignment 	 	  = "CCGC 5502 Automation Project" 
    Name  	 	      = "ruchikasoni.dahuja" 
    ExpirationDate 	= "2024-12-31" 
    Environment  	  = "Learning" 
  }
}
variable "linux_name" {
  
}
variable "linux_avs" {
  
}
variable "location" {
  
}
variable "nb_count" {
  
}
variable "linux_size" {
  
}
variable "linux_admin_username" {
  
}
variable "linux_os_disk_caching" {
  default = "ReadWrite"
}
variable "linux_os_disk_storage_account_type" {
  default = "Premium_LRS"
}
variable "linux_os_disk_size" {
  default = 32
}
variable "os_publisher" {
  default = "OpenLogic"
}
variable "os_offer" {
  default = "CentOS"
}
variable "os_sku" {
  default = "8_1-gen2"
}
variable "os_version" {
  default = "8.1.2020111901"
}
variable "linux_public_key" {
  
}
variable "linux_private_key" {
  
}
variable "linux_subnet" {
  
}

variable "publisher_network_watcher" {
  default = "Microsoft.Azure.NetworkWatcher"
}

variable "agent_type_network_watcher" {
  default = "NetworkWatcherAgentLinux"
}

variable "publisher_azure_monitor" {
  default = "Microsoft.Azure.Monitor"
}

variable "agent_type_azure_monitor" {
  default = "AzureMonitorLinuxAgent" 
}

variable "storage_account_uri" {
  
}

variable "resource_group_name" {
  
}