output "resource-group-name" {
  value = azurerm_resource_group.rg-terraform-states.name
  description = "The name of the resource group to hold the storage account"
}