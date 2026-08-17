variable "resource_group_name" {
  description = "Azure Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Canada Central"
}

variable "app_service_plan_name" {
  description = "App Service Plan name"
  type        = string
}

variable "web_app_name" {
  description = "Azure Web App name"
  type        = string
}