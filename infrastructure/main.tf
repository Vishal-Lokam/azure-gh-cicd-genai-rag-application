locals {
  tags = {
    created_by = "Terraform"
  }
}


resource "azurerm_resource_group" "infrastructure_rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.tags
}

data "azurerm_client_config" "current" {

}
