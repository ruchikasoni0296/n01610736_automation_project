locals {
  common_tags = {
    Assignment 	 	  = "CCGC 5502 Automation Assignment" 
    Name  	 	      = "ruchikasoni.dahuja" 
    ExpirationDate 	= "2024-12-31" 
    Environment  	  = "Learning" 
  }
}


variable "location" {
  
}

variable "linux_virtual_machine_ids" {

}

variable "windows_virtual_machine_ids" {

}

variable "virtual_machine_ids" {
}

variable "data_disk_type" {
  
}

variable "data_disk_option" {
  default = "Empty"
}

variable "data_disk_caching" {
  default = "ReadWrite" 
}

variable "data_disk_size" {
  
}

variable "resource_group_name" {
  
}
