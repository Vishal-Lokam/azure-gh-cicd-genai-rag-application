data "azurerm_subscription" "primary" {
}

resource "azuread_application" "github_oidc" {
  display_name = var.application_display_name
}

resource "azuread_service_principal" "github_oidc_sp" {
  client_id = azuread_application.github_oidc.client_id
}

resource "azurerm_role_assignment" "github_oidc_role_assignment" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.github_oidc_sp.object_id
}

resource "azuread_application_federated_identity_credential" "github_oidc_creds-main" {
  application_id = azuread_application.github_oidc.id
  display_name   = "${var.organisation_name}-${var.repository_name}-oidc-main"
  issuer         = var.github_issuer
  audiences      = ["${var.default_audience_name}"]
  subject        = "repo:${var.organisation_name}/${var.repository_name}:ref:refs/heads/main"
}

resource "azuread_application_federated_identity_credential" "github_oidc_creds-pr" {
  application_id = azuread_application.github_oidc.id
  display_name   = "${var.organisation_name}-${var.repository_name}-pr"
  issuer         = var.github_issuer
  audiences      = ["${var.default_audience_name}"]
  subject        = "repo:${var.organisation_name}/${var.repository_name}:pull_request"
}

