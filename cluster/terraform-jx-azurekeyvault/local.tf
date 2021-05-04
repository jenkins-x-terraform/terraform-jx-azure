locals {
  resource_group_name = var.resource_group_name != "" ? var.resource_group_name : "rg-keyvault-${join("", regexall("[A-Za-z0-9\\-_().]", var.cluster_name))}"
  key_vault_name      = var.key_vault_name != "" ? var.key_vault_name : substr(join("", regexall("[A-Za-z0-9\\-]", var.cluster_name)), 0, 24)
  tenant_id           = data.azurerm_subscription.current.tenant_id
  secret_map          = var.enabled ? var.secret_map : {}
}
