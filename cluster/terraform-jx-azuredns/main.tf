terraform {
  required_version = ">= 0.13.2"
  required_providers {
    azurerm = {
      version = ">=2.39.0"
    }
  }
}

data "azurerm_dns_zone" "apex_domain_zone" {
  count = var.apex_domain != "" ? 1 : 0
  name  = var.apex_domain
  resource_group_name = var.apex_resource_group_name
}

data "azurerm_subscription" "current" {
}

resource "azurerm_resource_group" "dns" {
  count    = var.subdomain != "" ?  1 : 0
  name     = local.resource_group_name
  location = var.location
}

resource "azurerm_dns_zone" "dns" {
  count               = var.apex_domain != "" && var.subdomain != "" ? 1 : 0
  name                = join(".", [var.subdomain, var.apex_domain])
  resource_group_name = azurerm_resource_group.dns.0.name
}

resource "azurerm_dns_ns_record" "subdomain_ns_delegation" {
  count               = var.apex_domain != "" && var.subdomain != "" && var.apex_domain_integration_enabled ? 1 : 0
  name                = var.subdomain
  zone_name           = data.azurerm_dns_zone.apex_domain_zone.0.name
  resource_group_name = var.apex_resource_group_name
  ttl                 = 60
  records             = length(azurerm_dns_zone.dns) == 0 ? [] : azurerm_dns_zone.dns[0].name_servers
  depends_on          = [azurerm_dns_zone.dns]
}

resource "azurerm_role_assignment" "Give_ExternalDNS_SP_Contributor_Access_to_ResourceGroup" {
  count                = var.subdomain != "" ?  1 : 0
  scope                = azurerm_resource_group.dns.0.id
  role_definition_name = "DNS Zone Contributor"
  principal_id         = var.principal_id
}

data "azurerm_resource_group" "apex_dns" {
  count    = var.apex_domain != "" && var.subdomain == "" ?  1 : 0
  name     = var.apex_resource_group_name
}

resource "azurerm_role_assignment" "Give_ExternalDNS_SP_Contributor_Access_to_ApexResourceGroup" {
  count                = var.apex_domain != "" && var.subdomain == "" ?  1 : 0
  scope                = data.azurerm_resource_group.apex_dns.0.id
  role_definition_name = "DNS Zone Contributor"
  principal_id         = var.principal_id
}