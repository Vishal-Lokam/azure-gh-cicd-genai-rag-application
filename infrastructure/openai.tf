resource "azurerm_cognitive_account" "azure_openai_account" {
  name                = var.azure_openai_account_name
  location            = "southindia"
  resource_group_name = azurerm_resource_group.infrastructure_rg.name
  kind                = "OpenAI"
  sku_name            = "S0"

  tags = local.tags
}

# TODO: Add Azure OpenAI deployment here
resource "azurerm_cognitive_deployment" "astral_gpt_41_nano" {
  name                 = "gpt-4.1-nano"
  cognitive_account_id = azurerm_cognitive_account.azure_openai_account.id

  model {
    format  = "OpenAI"
    name    = "gpt-4.1-nano"
    version = "2025-04-14"
  }

  sku {
    name     = "GlobalStandard"
    capacity = 10
  }
}

resource "azurerm_cognitive_deployment" "astral_text_embedding_large_3" {
  name                 = "text-embedding-3-large"
  cognitive_account_id = azurerm_cognitive_account.azure_openai_account.id

  model {
    format  = "OpenAI"
    name    = "text-embedding-3-large"
    version = 1
  }

  sku {
    name     = "Standard"
    capacity = 10
  }
}
