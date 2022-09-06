resource "azurerm_resource_group" "rg-terraform-states" {
  name     = "rg-terraform-states"
  location = "eastus"
  tags = {
    OwnerName  = "Chase"
    Automation = "True"
    AppType    = "Terraform"
  }
}

resource "azurerm_storage_account" "storage-backend-tf" {
  name                     = "storagebackendtf"
  resource_group_name      = azurerm_resource_group.rg-terraform-states.name
  location                 = "eastus"
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  access_tier              = "Hot"
  account_replication_type = "LRS"

  queue_properties {
    logging {
      read    = true
      write   = true
      delete  = true
      version = "1.0"
    }
  }

  tags = {
    OwnerName  = "Chase"
    Automation = "True"
    AppType    = "Terraform"
  }
}

resource "azurerm_storage_container" "tfstates-container" {
  name                  = "tf-state-files"
  storage_account_name  = azurerm_storage_account.storage-backend-tf.name
  container_access_type = "private"
}