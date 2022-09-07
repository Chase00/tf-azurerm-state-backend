resource "azurerm_resource_group" "rg-terraform-states" {
  name     = "rg-terraform-states"
  location = "eastus"
  tags = {
    OwnerName  = "Chase"
    Automation = "True"
    AppType    = "Terraform"
  }
}