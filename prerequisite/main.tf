#This repository is for creating resources that should be already present for the project to work
resource "azurerm_resource_group" "astralbound_prerequisites" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "prerequisitesstorageacc" {
  name                     = var.backend_storge_account_name
  resource_group_name      = azurerm_resource_group.astralbound_prerequisites.name
  account_replication_type = "LRS"
  account_tier             = "Standard"
  location                 = var.location
}

resource "azurerm_storage_container" "astralbound_tf_state" {
  name                  = var.backend_storge_container_name
  storage_account_id    = azurerm_storage_account.prerequisitesstorageacc.id
  container_access_type = "private"
}

resource "azurerm_role_assignment" "astralbound_tf_state_blob_contributor" {
  scope                            = azurerm_storage_container.astralbound_tf_state.resource_manager_id
  role_definition_name             = "Storage Blob Data Contributor"
  principal_id                     = azuread_service_principal.github_oidc_sp.object_id
  skip_service_principal_aad_check = true
  principal_type                   = "ServicePrincipal"
}
