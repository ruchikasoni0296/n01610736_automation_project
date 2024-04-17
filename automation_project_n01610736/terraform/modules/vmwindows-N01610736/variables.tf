locals {
  common_tags = {
    Assignment 	 	  = "CCGC 5502 Automation Assignment" 
    Name  	 	      = "ruchikasoni.dahuja" 
    ExpirationDate 	= "2024-12-31" 
    Environment  	  = "Learning" 
  }
}
variable "windows_avs" {
  
}
variable "resource-group-windows-loc" {
  
}
variable "resource-group-windows-name" {
  
}
variable "windows_name" {
  
}
variable "windows-network-subnet" {
  
}

variable "location" {
  
}
variable "windows_admin_username" {
  
}
variable "windows_admin_password" {
  
}
variable "windows_disk_caching" {
  default = "ReadWrite"
}
variable "windows_storage_account_type" {
  default = "StandardSSD_LRS"
}
variable "windows_disk_size" {
  default = 128
}
variable "windows_publisher" {
  default = "MicrosoftWindowsServer"
}
variable "windows_offer" {
  default = "WindowsServer"
}
variable "windows_sku" {
  default = "2016-Datacenter"
}
variable "windows_version" {
  default = "latest"
}
variable "nb_count" {
  
}
variable "windows_vm_size" {
  
}
