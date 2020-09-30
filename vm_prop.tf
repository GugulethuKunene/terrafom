resource "azurerm_virtual_machine" "sa_web" {
  name                  = "SA-WebVm"
  location              = var.location
  resource_group_name   = var.location
  network_interface_ids = azurerm_network_interface.public_nic.id
  vm_size               = "Standard_DS1_v2"

  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name          = "osdisk-1-harddisk"
    vhd_uri       = "${azurerm_storage_account.la-storage.primary_blob_endpoint}${azurerm_storage_account.la-cont.name}/osdisk-1-harddisk.vhd"
    caching       = "ReadWrite"
    create_option = "FromImage"
  }

  os_profile {
    computer_name  = "ubuntuweb"
    admin_username = var.vm_username
    admin_password = var.vm_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    environment = "cloudlearners"
  }
}

resource "azurerm_virtual_machine" "nsa-db" {
  name                  = "SA-DBVM"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = azurerm_network_interface.private_nic.id
  vm_size               = "Stamdard_DS1_v2"

  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name          = "osdisk-2-harddisk"
    vhd_uri       = "${azurerm_storage_account.la-storage.primary_blob_endpoint}${azurerm_storage_account.la-cont.name}/osdisk-2-harddisk.vhd"
    caching       = "ReadWrite"
    create_option = "FromImage"
  }

  storage_data_disk {
    name          = "datadisk-2"
    vhd_uri       = "${azurerm_storage_account.la_storage.primary_blob_endpoint}${azurerm_storage_container.la_cont.name}/datadisk-2.vhd"
    disk_size_gb  = "100"
    create_option = "Empty"
    lun           = 0
  }

  os_profile {
    computer_name  = "ubuntuweb"
    admin_username = var.vm_username
    admin_password = var.vm_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    group = "LinuxAcademy"
  }
}

