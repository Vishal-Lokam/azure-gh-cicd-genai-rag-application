resource "azurerm_key_vault" "astralbound_key_vault" {
  name                       = var.key_vault_name
  resource_group_name        = azurerm_resource_group.infrastructure_rg.name
  location                   = var.location
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  soft_delete_retention_days = 7
}

resource "azurerm_key_vault_access_policy" "kv_oidc_access_poicy" {
  key_vault_id = azurerm_key_vault.astralbound_key_vault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

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

resource "azurerm_key_vault_access_policy" "kv_user_access_poicy" {
  key_vault_id = azurerm_key_vault.astralbound_key_vault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = "33bbf20f-9bb6-4c40-9d22-c42eac9f1d9b"

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
