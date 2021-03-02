// ----------------------------------------------------------------------------
// Enforce Terraform version
//
// ----------------------------------------------------------------------------
terraform {
  required_version = ">= 0.13.2"
  required_providers {
    azurerm = {
      version = ">=2.39.0"
    }
  }
}

// ----------------------------------------------------------------------------
// Retrieve active subscription resources are being created in
// ----------------------------------------------------------------------------
data "azurerm_subscription" "current" {
}

// ----------------------------------------------------------------------------
// Setup Azure Resource Groups
// ----------------------------------------------------------------------------

resource "azurerm_resource_group" "network" {
  name     = local.network_resource_group_name
  location = var.location
}

resource "azurerm_resource_group" "cluster" {
  name     = local.cluster_resource_group_name
  location = var.location
}

// ----------------------------------------------------------------------------
// Setup Azure Cluster
// ----------------------------------------------------------------------------

module "cluster" {
  #depends_on               = [module.vnet]
  source                   = "./cluster"
  cluster_name             = var.cluster_name
  node_count               = var.node_count
  node_size                = var.node_size
  #vnet_subnet_id           = module.vnet.subnet_id
  vnet_subnet_id           = "/subscriptions/7a3d2c52-5501-436d-be5b-cf38fd1be994/resourceGroups/DSIT_Buc_Resource_group/providers/Microsoft.Network/virtualNetworks/GasSmeVN/subnets/omvp-subnet-qa"
  dns_prefix               = local.dns_prefix
  cluster_version          = var.cluster_version
  location                 = var.location
  resource_group_name      = azurerm_resource_group.cluster.name
  #network_resource_group   = local.network_resource_group_name
  network_resource_group   = "DSIT_Buc_Resource_group"
  cluster_network_model    = var.cluster_network_model
  node_resource_group_name = local.cluster_node_resource_group_name
  enable_log_analytics     = var.enable_log_analytics
  logging_retention_days   = var.logging_retention_days
}

// ----------------------------------------------------------------------------
// Setup Azure Vnet in to which to deploy Cluster
// ----------------------------------------------------------------------------

#module "vnet" {
#  source         = "./vnet"
#  resource_group = azurerm_resource_group.network.name
#  vnet_cidr      = var.vnet_cidr
#  subnet_cidr    = var.subnet_cidr
#  network_name   = local.network_name
#  subnet_name    = local.subnet_name
#  location       = var.location
#}
