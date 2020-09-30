resource "azurerm_public_ip" "sa_pip" {
  name                = "SA-PIP"
  location            = var.location
  resource_group_name = var.resource_group_name
  #resource_group_name = 
  allocation_method = "Static"

  tags = {
    environment = "testing"
  }
}

resource "azurerm_network_interface" "public_nic" {
  name                      = "SA-Web"
  location                  = var.location
  resource_group_name       = var.resource_group_name
  network_security_group_id = azurerm_network_security_group.nsg_web.id

  ip_configuration {
    name                          = "SA-WebPrivate"
    subnet_id                     = azurerm_subnet.la_subnet_1.id
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = azurerm_public_ip.sa_pip.id
  }
}

resource "azurerm_network_interface" "private_nic" {
  name                      = "SA-DB"
  location                  = var.resource_group_name
  resource_group_name       = var.resource_group_name
  network_security_group_id = azurerm_network_security_group.nsg_db.id

  ip_configuration {
    name                          = "SA-DBPrivate"
    subnet_id                     = azurerm_subnet.la_subnet_2.id
    private_ip_address_allocation = "static"
    private_ip_address            = "192.168.2.4"
    public_ip_address_id          = azurerm_public_ip.sa_pip.id
  }
}

