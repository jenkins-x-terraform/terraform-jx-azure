output "domain" {
  value = var.enabled ? trimprefix(join(".", [var.domain_name, var.apex_domain_name]), ".") : ""
}
output "name_servers" {
  value = var.enabled ? azurerm_dns_zone.dns.0.name_servers : []
}
output "resource_group_name" {
  value = var.enabled ? azurerm_resource_group.dns.0.name : ""
}
output "subscription_id" {
  value = data.azurerm_subscription.current.subscription_id
}
output "tenant_id" {
  value = data.azurerm_subscription.current.tenant_id
}
