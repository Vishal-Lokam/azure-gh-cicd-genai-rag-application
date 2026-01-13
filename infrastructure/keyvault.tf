# resource "azurerm_key_vault" "astralbound-key-vault" {
#   name                       = var.keyvault_name
#   resource_group_name        = azurerm_resource_group.infrastructure_rg.name
#   location                   = var.location
#   tenant_id                  = data.azurerm_client_config.current.tenant_id
#   sku_name                   = "standard"
#   soft_delete_retention_days = 7

#   access_policy {
#     tenant_id = data.azurerm_client_config.current.tenant_id
#     object_id = data.azurerm_client_config.current.object_id

#     key_permissions = [
#       "Get",
#       "Create",
#       "Delete",
#       "List"
#     ]

#     secret_permissions = [
#       "Get",
#       "Set",
#       "List",
#       "Delete",
#       "Purge",
#       "Recover"
#     ]

#     storage_permissions = [
#       "Get",
#       "Set"
#     ]
#   }
#   tags = local.tags
# }


# resource "azurerm_key_vault_secret" "azure-subscription-id" {
#   name         = "subscription-id"
#   value        = var.subscription_id
#   key_vault_id = azurerm_key_vault.astralbound-key-vault.id
#   tags         = local.tags
# }
