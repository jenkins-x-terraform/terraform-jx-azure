terraform {
  required_version = ">= 1.4.6"
  required_providers {
    azurerm = {
      version = ">=3.0.0"
    }
  }
}

data "azurerm_subscription" "current" {
}

data "azurerm_dns_zone" "apex_domain_zone" {
  count = local.enabled && local.with_subdomain && var.apex_domain_integration_enabled ? 1 : 0
  name  = var.apex_domain
}

data "azurerm_resource_group" "apex_resource_group" {
  count = local.enabled && local.with_subdomain && var.apex_domain_integration_enabled ? 1 : 0
  name = var.apex_resource_group_name
}

resource "azurerm_resource_group" "dns" {
  count    = local.enabled && (local.with_subdomain || var.dns_resources_enabled) ? 1 : 0
  name     = local.resource_group_name
  location = var.location
}

resource "azurerm_dns_zone" "dns" {
  count               = local.enabled && (local.with_subdomain || var.dns_resources_enabled) ? 1 : 0
  name                = join(".", [var.subdomain, var.apex_domain])
  resource_group_name = azurerm_resource_group.dns.0.name
}

resource "azurerm_dns_ns_record" "subdomain_ns_delegation" {
  count               = local.enabled && ((local.with_subdomain && var.apex_domain_integration_enabled) || var.dns_resources_enabled) ? 1 : 0
  name                = var.subdomain
  zone_name           = length(azurerm_dns_zone.dns) > 0 ? azurerm_dns_zone.dns[0].name_servers : ""
  resource_group_name = var.apex_resource_group_name
  ttl                 = 60
  records             = azurerm_dns_zone.dns[0].name_servers
  depends_on          = [azurerm_dns_zone.dns]
}

resource "azurerm_role_assignment" "Give_ExternalDNS_SP_Contributor_Access_to_ResourceGroup" {
  count                = local.enabled && ((local.with_subdomain && var.apex_domain_integration_enabled) || var.dns_resources_enabled) ? 1 : 0
  scope                = azurerm_resource_group.dns.0.id
  role_definition_name = "DNS Zone Contributor"
  principal_id         = var.principal_id
}

resource "azurerm_role_assignment" "Give_ExternalDNS_SP_Contributor_Access_to_ResourceGroup_to_Apex" {
  count                = !local.with_subdomain && (var.apex_domain_integration_enabled || var.dns_resources_enabled) ? 1 : 0
  scope                = length(data.azurerm_resource_group.apex_resource_group) > 0 ? data.azurerm_resource_group.apex_resource_group[0].id : ""
  role_definition_name = "DNS Zone Contributor"
  principal_id         = var.principal_id
}
