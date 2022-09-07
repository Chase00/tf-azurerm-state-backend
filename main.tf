// Resource group for the storage account
module "resource_groups" {
  source = "./modules/resource-groups"
}

// Storage account
module "storage_accounts" {
  source              = "./modules/storage-accounts"
  resource_group_name = module.resource_groups.resource-group-name
}

// Storage container inside the storage account to hold the state files
module "storage_containers" {
  source               = "./modules/storage-containers"
  storage_account_name = module.storage_accounts.storage-account-name
}

