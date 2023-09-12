resource "azurerm_log_analytics_workspace" "cluster" {
  count               = var.enable_log_analytics ? 1 : 0
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = var.logging_retention_days
}

resource "azurerm_log_analytics_workspace" "microsoft_defender" {
  name                = var.microsoft_defender_log_analytics_name
  location            = var.location
  resource_group_name = var.defender_resource_group
  sku                 = "PerGB2018"
  retention_in_days   = var.logging_retention_days
}
