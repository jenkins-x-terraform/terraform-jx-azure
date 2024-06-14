terraform {
  required_version = ">=1.4.6"
  backend "remote" {
    organization = "mqube"

    workspaces {
      name = "terraform-jx-azure"
    }
  }
}

module "cluster" {
  source                               = "./cluster"
  apex_domain_integration_enabled      = var.apex_domain_integration_enabled
  apex_domain                          = var.apex_domain
  apex_resource_group_name             = var.apex_resource_group_name
  cluster_name                         = var.cluster_name
  sku_tier                             = var.sku_tier
  cluster_network_model                = var.cluster_network_model
  cluster_node_resource_group_name     = var.cluster_node_resource_group_name
  cluster_resource_group_name          = var.cluster_resource_group_name
  cluster_version                      = var.cluster_version
  dns_resource_group_name              = var.dns_resource_group_name
  dns_prefix                           = var.dns_prefix
  subdomain                            = var.subdomain
  enable_log_analytics                 = var.enable_log_analytics
  external_registry_url                = var.external_registry_url
  use_existing_acr_name                = var.use_existing_acr_name
  use_existing_acr_resource_group_name = var.use_existing_acr_resource_group_name
  oss_registry_name                    = var.oss_registry_name
  jx_bot_token                         = var.jx_bot_token
  jx_git_url                           = var.jx_git_url
  jx_bot_username                      = var.jx_bot_username
  key_vault_enabled                    = var.key_vault_enabled
  key_vault_name                       = var.key_vault_name
  key_vault_resource_group_name        = var.key_vault_resource_group_name
  key_vault_sku                        = var.key_vault_sku
  location                             = var.location
  logging_retention_days               = var.logging_retention_days
  network_name                         = var.network_name
  network_resource_group_name          = var.network_resource_group_name
  node_count                           = var.node_count
  min_node_count                       = var.min_node_count
  max_node_count                       = var.max_node_count
  node_size                            = var.node_size
  use_spot_ml                          = var.use_spot_ml
  spot_max_price_ml                    = var.spot_max_price_ml
  ml_node_count                        = var.ml_node_count
  min_ml_node_count                    = var.min_ml_node_count
  max_ml_node_count                    = var.max_ml_node_count
  ml_node_size                         = var.ml_node_size
  use_spot                             = var.use_spot
  spot_max_price                       = var.spot_max_price
  build_node_size                      = var.build_node_size
  build_node_count                     = var.build_node_count
  min_build_node_count                 = var.min_build_node_count
  max_build_node_count                 = var.max_build_node_count
  use_spot_infra                       = var.use_spot_infra
  spot_max_price_infra                 = var.spot_max_price_infra
  infra_node_size                      = var.infra_node_size
  infra_node_count                     = var.infra_node_count
  min_infra_node_count                 = var.min_infra_node_count
  max_infra_node_count                 = var.max_infra_node_count
  use_spot_mlbuild                     = var.use_spot_mlbuild
  spot_max_price_mlbuild               = var.spot_max_price_mlbuild
  mlbuild_node_size                    = var.mlbuild_node_size
  mlbuild_node_count                   = var.mlbuild_node_count
  min_mlbuild_node_count               = var.min_mlbuild_node_count
  max_mlbuild_node_count               = var.max_mlbuild_node_count
  storage_resource_group_name          = var.storage_resource_group_name
  subnet_cidr                          = var.subnet_cidr
  subnet_name                          = var.subnet_name
  vnet_cidr                            = var.vnet_cidr
  azure_policy_bool                    = var.azure_policy_bool
  acr_enabled                          = var.acr_enabled
  install_kuberhealthy                 = var.install_kuberhealthy
  dns_resources_enabled                = var.dns_resources_enabled
}

output "connect" {
  description = "Connect to cluster"
  value       = module.cluster.connect
}
output "follow_install_logs" {
  description = "Follow Jenkins X install logs"
  value       = "jx admin log"
}
output "docs" {
  description = "Follow Jenkins X 3.x docs for more information"
  value       = "https://jenkins-x.io/v3/"
}
output "kube_config_admin" {
  value     = module.cluster.kube_config_admin
  sensitive = true
}

output "kubelet_client_id" {
  value = module.cluster.kubelet_client_id
}