output "domain" {
  value = trimprefix(join(".", [var.subdomain, var.apex_domain]), ".")
}
output "name_servers" {
  value = local.enabled && local.with_subdomain ? join(",", azurerm_dns_zone.dns.0.name_servers) : "--"
}
output "resource_group_name" {
  value = local.enabled && local.with_subdomain ? azurerm_resource_group.dns.0.name : var.apex_resource_group_name
}
output "subscription_id" {
  value = data.azurerm_subscription.current.subscription_id
}
output "tenant_id" {
  value = data.azurerm_subscription.current.tenant_id
}
