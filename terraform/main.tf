terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "project5_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_service_plan" "project5_plan" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.project5_rg.location
  resource_group_name = azurerm_resource_group.project5_rg.name

  os_type  = "Linux"
  sku_name = "F1"
}

resource "azurerm_linux_web_app" "project5_app" {
  name                = var.web_app_name
  location            = azurerm_resource_group.project5_rg.location
  resource_group_name = azurerm_resource_group.project5_rg.name
  service_plan_id     = azurerm_service_plan.project5_plan.id

  site_config {
    always_on = false
    application_stack {
      node_version = "20-lts"
    }
  }

  app_settings = {
    "SCM_DO_BUILD_DURING_DEPLOYMENT" = "true"
  }
}