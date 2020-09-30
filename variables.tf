variable "resource_group_name" {
  type    = string
  default = ""
}

variable "location" {
  type    = string
  default = ""
}

variable "vnet_cidr" {
  type    = list
  default = "192.168.0.0/16"
}

variable "subnet1_cidr" {
  default = "192.168.1.0/24"
}

variable "subnet2_cidr" {
  default = "192.168.2.0/24"
}

variable "vm_username" {
  type    = string
  default = "redhat"
}

variable "vm_password" {
  type    = string
  default = "redhat"
}

