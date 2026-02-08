terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.16.0"
    }

    random = {
      source  = "hashicorp/random"
      version = ">=3.8.1"
    }
  }
  backend "azurerm" {
    key      = "terraform.tfstate"
    use_oidc = true
  }

}

provider "azurerm" {
  use_oidc = true
  features {

  }
}

provider "random" {}




