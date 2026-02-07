variable "subscription_id" {
  description = "Subscription id of the Azure subscription"
  type        = string
}

variable "github_token" {
  description = "Github Personal Access token(classic)"
  type        = string
  sensitive   = true
}

variable "organisation_name" {
  description = "Name of the organisation that the github repository is part of"
  type        = string
}

variable "repository_name" {
  description = "Name of the github repository"
  type        = string
}

variable "application_display_name" {
  description = "display of the application registration"
  type        = string
}

variable "github_issuer" {
  description = "Federated credential Issuer"
  type        = string
}

variable "default_audience_name" {
  description = "Federated credential audiences"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name for prerequisite resources"
  type        = string
}

variable "location" {
  description = "Location for prerequisite resources"
  type        = string
}

variable "backend_storge_account_name" {
  description = "Storage account for remote backend"
  type        = string
}

variable "backend_storge_container_name" {
  description = "Storage container for remote backend"
  type        = string
}

