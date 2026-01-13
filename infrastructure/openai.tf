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
  for_each             = var.azure_openai_deployment
  name                 = each.value.deployment_name
  cognitive_account_id = azurerm_cognitive_account.azure_openai_account.id

  model {
    format = each.value.model_format
    name   = each.value.model_name
  }

  sku {
    name     = each.value.sku
    capacity = each.value.capacity
  }
}

# resource "azurerm_cognitive_deployment" "astral_text_embedding_large_3" {
#   name                 = "text-embedding-3-large"
#   cognitive_account_id = azurerm_cognitive_account.azure_openai_account.id

#   model {
#     format  = "OpenAI"
#     name    = "text-embedding-3-large"
#     version = 1
#   }

#   sku {
#     name     = "Standard"
#     capacity = 10
#   }
# }
