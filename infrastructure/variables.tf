variable "subscription_id" {
  description = "Subscription id of the Azure subscription"
  type        = string
}


variable "location" {
  description = "Location for prerequisite resources"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group for the infrastructure"
  type        = string
}

variable "azure_openai_account_name" {
  description = "Name of the Azure OpenAI account"
  type        = string
}

variable "azure_openai_deployment" {
  description = "List of all the models that need to be deployed"
  type = list(object({
    deployment_name = string
    model_name      = string
    model_format    = string
    model_version   = optional(string)
    sku             = string
    capacity        = number
  }))
}

variable "postgres_admin_login" {
  description = "administrator login for Azure Postgres flexible server"
  type        = string
}

variable "key_vault_name" {
  description = "Name of the key vault"
  type        = string
}

variable "user_object_id" {
  description = "User's object id so you can manage the access from the portal"
  type        = string
}
