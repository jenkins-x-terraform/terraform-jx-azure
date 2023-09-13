// ----------------------------------------------------------------------------
// Enforce Terraform version
//
// ----------------------------------------------------------------------------
terraform {
  required_version = ">= 1.4.6"
  required_providers {
    azurerm = {
      version = ">= 3.0.0"
    }
  }
}

resource "azurerm_resource_group" "acr" {
  count = var.use_existing_acr_name == null ? 1 : 0

  name     = local.resource_group_name
  location = var.location
}

resource "azurerm_container_registry" "acr" {
  count = var.use_existing_acr_name == null ? 1 : 0

  name                = local.container_registry_name
  resource_group_name = azurerm_resource_group.acr[0].name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
}

data "azurerm_container_registry" "acr_existing" {
  count = var.use_existing_acr_name == null ? 0 : 1

  name                = var.use_existing_acr_name
  resource_group_name = var.use_existing_acr_resource_group_name
}

resource "azurerm_role_assignment" "acrpull" {
  scope                = var.use_existing_acr_name == null ? azurerm_container_registry.acr[0].id : data.azurerm_container_registry.acr_existing[0].id
  role_definition_name = "AcrPull"
  principal_id         = var.principal_id
}

resource "azurerm_role_assignment" "acrpush" {
  scope                = var.use_existing_acr_name == null ? azurerm_container_registry.acr[0].id : data.azurerm_container_registry.acr_existing[0].id
  role_definition_name = "AcrPush"
  principal_id         = var.principal_id
}
