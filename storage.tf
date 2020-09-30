resource "azurerm_storage_account" "la-storage" {
  name                      = "cloudlearners"
  resource_group_name       = var.resource_group_name
  location                  = var.location
  account_tier              = "Standard"
  account_replication_type  = "GRS"
  enable_https_traffic_only = true // for secure traffic

  tags = {
    group = "cloudlearners"
  }
}

resource "azurerm_storage_container" "la_cont" {
  name                  = "vhds"
  storage_account_name  = azurerm_storage_account.la-storage.name
  container_access_type = "private"
}

