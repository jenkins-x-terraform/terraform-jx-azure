// ----------------------------------------------------------------------------
// Enforce Terraform version
//
// ----------------------------------------------------------------------------
terraform {
  required_version = ">= 1.3.2"
  required_providers {
    azurerm = {
      version = ">=2.56.0"
    }
  }
}

resource "azurerm_container_registry" "oss_acr" {
  name                = "ossregistry"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Standard"
  admin_enabled       = true
}

resource "azurerm_role_assignment" "oss_pull" {
  scope                = azurerm_container_registry.oss_acr.id
  role_definition_name = "AcrPull"
  principal_id = "00000000-0000-0000-0000-000000000000"
}

resource "azurerm_role_assignment" "oss_push" {
  scope                = azurerm_container_registry.oss_acr.id
  role_definition_name = "AcrPush"
  principal_id         = var.principal_id
}
