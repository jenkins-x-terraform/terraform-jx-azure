// ----------------------------------------------------------------------------
// Enforce Terraform version
//
// ----------------------------------------------------------------------------
terraform {
  required_version = ">= 0.13.2"
  required_providers {
    azurerm = {
      version = ">=2.56.0"
    }
  }
}

resource "azurerm_resource_group" "acr" {
  count    = var.external_registry_url == "" ? 1 : 0
  name     = local.resource_group_name
  location = var.location
}

resource "azurerm_container_registry" "acr" {
  count               = var.external_registry_url == "" ? 1 : 0
  name                = local.container_registry_name
  resource_group_name = azurerm_resource_group.acr[0].name
  location            = var.location
  sku                 = "Standard"
  admin_enabled       = true
}

resource "azurerm_role_assignment" "acrpull" {
  count                = var.external_registry_url == "" ? 1 : 0
  scope                = azurerm_container_registry.acr[0].id
  role_definition_name = "AcrPull"
  principal_id         = var.principal_id
}

resource "azurerm_role_assignment" "acrpush" {
  count                = var.external_registry_url == "" ? 1 : 0
  scope                = azurerm_container_registry.acr[0].id
  role_definition_name = "AcrPush"
  principal_id         = var.principal_id
}
