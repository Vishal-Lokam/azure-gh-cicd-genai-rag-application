variable "subscription_id" {
  description = "Subscription id of the Azure subscription"
  type        = string
}

variable "keyvault_name" {
  description = "Key valut name"
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
    model_format    = string,
    model_name      = string
    version         = string
    model_sku       = string
    model_capacity  = number
  }))
  default = []
}
