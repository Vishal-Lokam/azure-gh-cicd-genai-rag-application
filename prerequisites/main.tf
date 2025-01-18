#This repository is for creating resources that should be already present for the project to work
resource "azurerm_resource_group" "astralbound-prerequisites" {
  name     = "astralbound-prerequisites"
  location = "westindia"
}

resource "azurerm_storage_account" "prerequisitesstorageacc" {
  name                     = "prerequisitesstorageacc"
  resource_group_name      = azurerm_resource_group.astralbound-prerequisites.name
  account_replication_type = "LRS"
  account_tier             = "Standard"
  location                 = "westindia"
}

resource "azurerm_storage_container" "astralbound-tf-state" {
  name                  = "astralbound-tf-state"
  storage_account_id    = azurerm_storage_account.prerequisitesstorageacc.id
  container_access_type = "private"
}

data "azurerm_client_config" "current" {

}

resource "azurerm_key_vault" "astralbound-key-vault" {
  name                       = "astralbound-key-vault"
  resource_group_name        = azurerm_resource_group.astralbound-prerequisites.name
  location                   = "westindia"
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  soft_delete_retention_days = 7

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
      "Create",
      "Delete",
      "List"
    ]

    secret_permissions = [
      "Get",
      "Set",
      "List",
      "Delete",
      "Purge",
      "Recover"
    ]

    storage_permissions = [
      "Get",
      "Set"
    ]
  }

}


resource "azurerm_key_vault_secret" "azure-subscription-id" {
  name         = "subscription-id"
  value        = var.subscription_id
  key_vault_id = azurerm_key_vault.astralbound-key-vault.id
}

