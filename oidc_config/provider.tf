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
    github = {
      source  = "integrations/github"
      version = ">=6.5.0"
    }
  }
}

provider "azurerm" {
  features {
  }
  subscription_id = var.subscription_id
}

provider "azuread" {
}

provider "github" {
  token = var.github_token
  owner = var.organisation_name
}
