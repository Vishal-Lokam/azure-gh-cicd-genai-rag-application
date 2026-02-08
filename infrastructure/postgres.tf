resource "random_string" "postgres_password" {
  length = 16
}

resource "azurerm_key_vault_secret" "kv_secret_postgres_password" {
  name         = "postgres_password"
  value        = random_string.postgres_password.result
  key_vault_id = azurerm_key_vault.astralbound-key-vault.id
}

resource "azurerm_postgresql_flexible_server" "astralbound_postgres" {
  name                          = "astralbound-postgres"
  resource_group_name           = azurerm_resource_group.infrastructure_rg.name
  location                      = var.location
  version                       = "17"
  public_network_access_enabled = true
  administrator_login           = var.postgres_admin_login
  administrator_password        = random_string.postgres_password.result
  storage_mb                    = "32768"
  sku_name                      = "B_Standard_B1ms"
  zone                          = "1"

  tags = local.tags
}
