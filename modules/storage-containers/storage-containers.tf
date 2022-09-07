resource "azurerm_storage_container" "tfstates-container" {
  name                  = "tf-state-files"
  storage_account_name  = var.storage_account_name
  container_access_type = "private"
}