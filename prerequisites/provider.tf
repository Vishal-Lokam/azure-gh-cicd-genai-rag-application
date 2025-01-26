terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.16.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = ">=3.1.0"
    }
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }

  # subscription_id = var.subscription_id
  # client_id       = var.client_id
  # tenant_id       = var.tenant_id
  use_oidc = true
}

provider "azuread" {
}

