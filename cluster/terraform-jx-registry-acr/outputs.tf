output "registry_url" {
  value = var.external_registry_url == "" ? var.external_registry_url : var.use_existing_acr_name == null ? azurerm_container_registry.acr[0].name : data.azurerm_container_registry.acr_existing[0].name
}
output "admin_username" {
  value = var.external_registry_url == "" ? "" : var.use_existing_acr_name == null ? azurerm_container_registry.acr[0].admin_username : data.azurerm_container_registry.acr_existing[0].admin_username
}
output "admin_password" {
  value = var.external_registry_url == "" ? "" : var.use_existing_acr_name == null ? azurerm_container_registry.acr[0].admin_password : data.azurerm_container_registry.acr_existing[0].admin_password
}
