resource "azurerm_key_vault" "astralbound-key-vault" {
  name                       = var.keyvault_name
  resource_group_name        = azurerm_resource_group.astralbound-prerequisites.name
  location                   = var.location
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  soft_delete_retention_days = 7

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = azuread_service_principal.github_oidc_sp.object_id

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

resource "azurerm_key_vault_secret" "postgres-admin-password" {
  name         = "postgres-administrator-password"
  value        = var.postgres_admin_password
  key_vault_id = azurerm_key_vault.astralbound-key-vault.id
}


resource "azurerm_role_assignment" "keyvault_role_assignment" {
  scope                = azurerm_key_vault.astralbound-key-vault.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azuread_service_principal.github_oidc_sp.object_id
}
