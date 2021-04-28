output "domain" {
  value = trimprefix(join(".", [var.subdomain, var.apex_domain]), ".")
}
output "name_servers" {
  value = azurerm_dns_zone.dns.0.name_servers
}
output "resource_group_name" {
  value = azurerm_resource_group.dns.0.name
}
output "subscription_id" {
  value = data.azurerm_subscription.current.subscription_id
}
output "tenant_id" {
  value = data.azurerm_subscription.current.tenant_id
}
