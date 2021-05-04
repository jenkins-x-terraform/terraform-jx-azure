output "key_vault_name" {
  value = var.enabled ? azurerm_key_vault.jx.0.name : ""
}
output "tenant_id" {
  value = var.enabled ? azurerm_key_vault.jx.0.tenant_id : ""
}
output "subscription_id" {
  value = var.enabled ? data.azurerm_subscription.current.subscription_id : ""
}
