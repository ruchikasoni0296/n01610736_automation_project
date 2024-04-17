locals {
  common_tags = {
    Assignment 	 	= "CCGC 5502 Automation Assignment" 
    Name  	 	    = "ruchikasoni.dahuja" 
    ExpirationDate 	= "2024-12-31" 
    Environment  	= "Learning" 
  }
}
variable "law_name" {
  default = "n01610736-law"
}
variable "location" {}
variable "resource_group" {}
variable "law_sku" {
  default = "PerGB2018"
}
variable "rsv_name" {
  default = "vault-n01610736"
}
variable "rsv_sku" {
  default = "Standard"
}
variable "sa_name" {
  default = "san01610736"
}