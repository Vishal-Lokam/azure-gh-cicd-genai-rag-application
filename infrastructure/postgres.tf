data "azurerm_key_vault" "astralbound_keyvault" {
  name                = "kv-astralbound"
  resource_group_name = "astralbound-prerequisites"
}

data "azurerm_key_vault_secret" "postgres_admin_password" {
  name         = "postgres-administrator-password"
  key_vault_id = data.azurerm_key_vault.astralbound_keyvault.id
}



resource "azurerm_postgresql_flexible_server" "astralbound_postgres" {
  name                          = "astralbound-postgres"
  resource_group_name           = azurerm_resource_group.infrastructure_rg.name
  location                      = var.location
  version                       = "17"
  public_network_access_enabled = true
  administrator_login           = var.postgres_admin_login
  administrator_password        = data.azurerm_key_vault_secret.postgres_admin_password.value
  storage_mb                    = "32768"
  sku_name                      = "B_Standard_B1ms"

  tags = local.tags
}
