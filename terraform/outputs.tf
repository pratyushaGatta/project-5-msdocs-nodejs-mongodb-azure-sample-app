output "resource_group_name" {
  value = azurerm_resource_group.project5_rg.name
}

output "web_app_name" {
  value = azurerm_linux_web_app.project5_app.name
}

output "web_app_url" {
  value = "https://${azurerm_linux_web_app.project5_app.default_hostname}"
}