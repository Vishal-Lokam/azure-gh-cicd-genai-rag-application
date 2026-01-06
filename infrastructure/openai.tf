resource "azurerm_cognitive_account" "azure_openai_account" {
  name                = var.azure_openai_account_name
  location            = "swedencentral"
  resource_group_name = azurerm_resource_group.infrastructure_rg
  kind                = "OpenAI"
  sku_name            = "S0"

  tags = local.tags
}

# TODO: Add Azure OpenAI deployment here
