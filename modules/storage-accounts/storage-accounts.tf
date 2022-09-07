resource "azurerm_storage_account" "storage-backend-tf" {
  name                     = "storagebackendtf${random_string.random.result}"
  resource_group_name      = var.resource_group_name
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

resource "random_string" "random" {
  length  = 6
  special = false
  upper   = false
}