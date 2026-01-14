data "azurerm_client_config" "current" {

}

resource "github_actions_secret" "client_id_secret" {
  repository      = var.repository_name
  secret_name     = "AZURE_CLIENT_ID"
  plaintext_value = azuread_application.github_oidc.client_id
}

resource "github_actions_secret" "subscription_id_secret" {
  repository      = var.repository_name
  secret_name     = "AZURE_SUBSCRIPTION_ID"
  plaintext_value = data.azurerm_client_config.current.subscription_id
}

resource "github_actions_secret" "tenant_id_secret" {
  repository      = var.repository_name
  secret_name     = "AZURE_TENANT_ID"
  plaintext_value = data.azurerm_client_config.current.tenant_id
}

resource "github_actions_secret" "backend_resource_group_secret" {
  repository      = var.repository_name
  secret_name     = "BACKEND_RESOURCE_GROUP_NAME"
  plaintext_value = azurerm_resource_group.astralbound-prerequisites.name
}

resource "github_actions_secret" "backend_storage_account_secret" {
  repository      = var.repository_name
  secret_name     = "BACKEND_STORAGE_ACCOUNT_NAME"
  plaintext_value = azurerm_storage_account.prerequisitesstorageacc.name
}

resource "github_actions_secret" "backend_storage_account_container_secret" {
  repository      = var.repository_name
  secret_name     = "BACKEND_STORAGE_ACCOUNT_CONTAINER_NAME"
  plaintext_value = azurerm_storage_container.astralbound-tf-state.name
}
