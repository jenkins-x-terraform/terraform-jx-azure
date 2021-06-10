output "domain" {
  value = var.subdomain == "" ? var.apex_domain : trimprefix(join(".", [var.subdomain, var.apex_domain]), ".")
}
output "name_servers" {
  value = length(azurerm_dns_zone.dns) == 0 ? [] : azurerm_dns_zone.dns[0].name_servers
}
output "resource_group_name" {
  value = length(azurerm_dns_zone.dns) == 0 ? data.azurerm_dns_zone.apex_domain_zone.0.resource_group_name : azurerm_resource_group.dns[0].name
}
output "subscription_id" {
  value = data.azurerm_subscription.current.subscription_id
}
output "tenant_id" {
  value = data.azurerm_subscription.current.tenant_id
}
