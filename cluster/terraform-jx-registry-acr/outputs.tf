output "registry_name" {
  value = var.external_registry_url != "" ? var.external_registry_url : (var.use_existing_acr_name == null ? (length(azurerm_container_registry.acr) > 0 ? lower("${azurerm_container_registry.acr[0].name}.azurecr.io") : "") : (length(data.azurerm_container_registry.acr_existing) > 0 ? data.azurerm_container_registry.acr_existing[0].name : ""))
}

output "admin_username" {
  value = var.external_registry_url != "" ? "" : (var.use_existing_acr_name == null ? (length(azurerm_container_registry.acr) > 0 ? azurerm_container_registry.acr[0].admin_username : "") : (length(data.azurerm_container_registry.acr_existing) > 0 ? data.azurerm_container_registry.acr_existing[0].admin_username : ""))
}

output "admin_password" {
  value = var.external_registry_url != "" ? "" : (var.use_existing_acr_name == null ? (length(azurerm_container_registry.acr) > 0 ? azurerm_container_registry.acr[0].admin_password : "") : (length(data.azurerm_container_registry.acr_existing) > 0 ? data.azurerm_container_registry.acr_existing[0].admin_password : ""))
}

output "resource_group_name" {
  value = var.external_registry_url != "" ? "" : (var.use_existing_acr_resource_group_name == null ? (length(azurerm_container_registry.acr) > 0 ? azurerm_container_registry.acr[0].resource_group_name : "") : (length(data.azurerm_container_registry.acr_existing) > 0 ? data.azurerm_container_registry.acr_existing[0].resource_group_name : ""))
}
