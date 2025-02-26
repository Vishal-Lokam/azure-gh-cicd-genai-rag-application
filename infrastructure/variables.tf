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
