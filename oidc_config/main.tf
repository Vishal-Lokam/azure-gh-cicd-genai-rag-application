#This repository is for creating resources that should be already present for the project to work
resource "azurerm_resource_group" "astralbound-prerequisites" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "prerequisitesstorageacc" {
  name                     = var.backend_storge_account_name
  resource_group_name      = azurerm_resource_group.astralbound-prerequisites.name
  account_replication_type = "LRS"
  account_tier             = "Standard"
  location                 = var.location
}

resource "azurerm_storage_container" "astralbound-tf-state" {
  name                  = var.backend_storge_container_name
  storage_account_id    = azurerm_storage_account.prerequisitesstorageacc.id
  container_access_type = "private"
}

resource "azurerm_role_assignment" "astralbound-tf-state-blob-contributor" {
  scope                            = azurerm_storage_container.astralbound-tf-state.resource_manager_id
  role_definition_name             = "Storage Blob Data Contributor"
  principal_id                     = azuread_service_principal.github_oidc_sp.object_id
  skip_service_principal_aad_check = true
  principal_type                   = "ServicePrincipal"
}

data "azurerm_client_config" "current" {

}

resource "azurerm_key_vault" "astralbound-key-vault" {
  name                       = var.keyvault_name
  resource_group_name        = azurerm_resource_group.astralbound-prerequisites.name
  location                   = var.location
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

