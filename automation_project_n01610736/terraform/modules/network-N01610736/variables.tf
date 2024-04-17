locals {
  common_tags = {
    Assignment 	 	  = "CCGC 5502 Automation Assignment" 
    Name  	 	      = "ruchikasoni.dahuja" 
    ExpirationDate 	= "2024-12-31" 
    Environment  	  = "Learning" 
  }
}
variable "vnet_name" {
  type = string
  default = "n01610736-VNET"
}
variable "subnet_name" {
  default = "n01610736-SUBNET"
}
variable "vnet_space" {
  default = ["10.0.0.0/16"]
}
variable "location" {}
variable "n01610736RG" {}
variable "n01610736-SUBNET" {}
variable "resource_group_name" {}
variable "subnet_space" {
  default = ["10.0.1.0/24"]
}
variable "n01610736-NSG" {
  type = string
  default = "n01610736-NSG"
}