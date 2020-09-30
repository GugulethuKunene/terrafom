resource "azurerm_virtual_network" "sa_vnet" {
  name                = "Cloud-ft-vnet"
  address_space       = var.vnet_cidr
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "sa_subnet_1" {
  name                 = "Cloud-Subnet-1"
  address_prefix       = var.subnet1_cidr
  virtual_network_name = azurerm_virtual_network.la_vnet.name
  resource_group_name  = var.resource_group_name
}

resource "azurerm_subnet" "sa_subnet_2" {
  name                 = "Cloud-Subnet-2"
  address_prefix       = var.subnet2_cidr
  virtual_network_name = azurerm_virtual_network.la_vnet.name
  resource_group_name  = var.resource_group_name
}
