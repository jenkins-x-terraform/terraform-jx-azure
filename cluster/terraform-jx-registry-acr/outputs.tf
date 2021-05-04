output "registry_url" {
  value = var.external_registry_url == "" ? "${azurerm_container_registry.acr[0].name}.azurecr.io" : var.external_registry_url
}
output "admin_username" {
  value = var.external_registry_url == "" ? azurerm_container_registry.acr[0].admin_username : ""
}
output "admin_password" {
  value = var.external_registry_url == "" ? azurerm_container_registry.acr[0].admin_password : ""
}
