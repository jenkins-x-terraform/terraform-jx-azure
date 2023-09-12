// ----------------------------------------------------------------------------
// Enforce Terraform version
//
// ----------------------------------------------------------------------------
terraform {
  required_version = ">= 1.3.2"
  required_providers {
    azurerm = {
      version = ">=3.0.0"
    }
  }
}

resource "azurerm_container_registry" "oss_acr" {
  name                = var.oss_registry_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  anonymous_pull_enabled = local.anonymous_pull_enabled
  admin_enabled       = local.admin_enabled
}

resource "azurerm_role_assignment" "oss_push" {
  scope                = azurerm_container_registry.oss_acr.id
  role_definition_name = local.AcrPush_definition_name
  principal_id         = var.principal_id
}
