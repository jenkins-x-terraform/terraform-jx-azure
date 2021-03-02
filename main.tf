terraform {
  required_version = ">= 0.13.2"
  required_providers {
    random = {
      version = ">=3.0.0"
    }
    kubernetes = {
      version = ">=1.13.3"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "tfstate21043"
    container_name       = "tfstate"
    key                  = "omv-qa.terraform.tfstate"
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = false
    }
  }
}

provider "kubernetes" {
  host = module.cluster.cluster_endpoint
  cluster_ca_certificate = base64decode(
    module.cluster.ca_certificate,
  )
  client_certificate = base64decode(
    module.cluster.client_certificate,
  )
  client_key = base64decode(
    module.cluster.client_key,
  )
}

provider "helm" {
  kubernetes {

    host = module.cluster.cluster_endpoint
    cluster_ca_certificate = base64decode(
      module.cluster.ca_certificate,
    )
    client_certificate = base64decode(
      module.cluster.client_certificate,
    )
    client_key = base64decode(
      module.cluster.client_key,
    )
  }
}

module "cluster" {
  source                           = "./terraform-jx-cluster-aks"
  cluster_name                     = local.cluster_name
  cluster_network_model            = var.cluster_network_model
  cluster_node_resource_group_name = var.cluster_node_resource_group_name
  cluster_resource_group_name      = var.resource_group_name
  cluster_version                  = var.cluster_version
  enable_log_analytics             = var.enable_log_analytics
  location                         = var.location
  logging_retention_days           = var.logging_retention_days
  network_resource_group_name      = var.resource_group_name
  network_name                     = var.network_name
  node_count                       = var.node_count
  node_size                        = var.node_size
  subnet_name                      = var.subnet_name
  subnet_cidr                      = var.subnet_cidr
  vnet_cidr                        = var.vnet_cidr
}

module "registry" {
  source       = "./terraform-jx-registry-acr"
  cluster_name = local.cluster_name
  principal_id = module.cluster.kubelet_identity_id
  location     = var.location
  resource_group_name = var.resource_group_name
}

#module "jx-boot" {
#  source              = "./terraform-jx-boot"
#  depends_on          = [module.cluster]
#  jx_git_url          = var.jx_git_url
#  jx_bot_username     = var.jx_bot_username
#  jx_bot_token        = var.jx_bot_token
#  job_secret_env_vars = local.job_secret_env_vars
#  install_vault       = !var.key_vault_enabled
#}

#module "dns" {
#  source                          = "./terraform-jx-azuredns"
#  enabled                         = var.dns_enabled
#  apex_domain_integration_enabled = var.apex_domain_integration_enabled
#  apex_domain_name                = var.apex_domain_name
#  apex_resource_group_name        = var.apex_resource_group_name
#  cluster_name                    = local.cluster_name
#  domain_name                     = var.domain_name
#  location                        = var.location
#  principal_id                    = module.cluster.kubelet_identity_id
#  resource_group_name             = var.resource_group_name
#}

module "secrets" {
  source              = "./terraform-jx-azurekeyvault"
  enabled             = var.key_vault_enabled
  principal_id        = module.cluster.kubelet_identity_id
  cluster_name        = local.cluster_name
  resource_group_name = var.resource_group_name
  key_vault_name      = var.key_vault_name
  key_vault_sku       = var.key_vault_sku
  location            = var.location
  secret_map          = local.merged_secrets
}

module "storage" {
  source               = "./terraform-jx-azure-storage"
  resource_group_name  = var.resource_group_name
  cluster_name         = local.cluster_name
  location             = var.location
  storage_principal_id = module.cluster.kubelet_identity_id
}

output "connect" {
  description = "Connect to cluster"
  value       = module.cluster.connect
}

output "kube_config_admin" {
  value     = module.cluster.kube_config_admin_raw
  sensitive = true
}
