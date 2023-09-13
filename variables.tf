variable "cluster_name" {
  description = "Variable to provide your desired name for the cluster. The script will create a random name if this is empty"
  type        = string
  default     = ""
}
variable "location" {
  type        = string
  default     = "australiaeast"
  description = "The Azure region in to which to provision the cluster"
}

// ----------------------------------------------------------------------------
// JX Boot variables
// ----------------------------------------------------------------------------

variable "jx_git_url" {
  description = "URL for the Jenkins X cluster git repository"
  type        = string
}
variable "jx_bot_username" {
  description = "Bot username used to interact with the Jenkins X cluster git repository"
  type        = string
}
variable "jx_bot_token" {
  description = "Bot token used to interact with the Jenkins X cluster git repository"
  type        = string
}
variable "server_side_apply_enabled" {
  type        = bool
  description = "BETA: Flag to indicate to the jx-git-operator that you would like to use server side apply"
  default     = false
}

variable "install_kuberhealthy" {
  description = "Flag to specify if kuberhealthy operator should be installed"
  type        = bool
  default     = false
}

// ----------------------------------------------------------------------------
// Machine variables
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// System nodepool variables
// ----------------------------------------------------------------------------
variable "node_size" {
  type        = string
  default     = "Standard_B2ms"
  description = "The size of the worker node to use for the cluster"
}
variable "node_count" {
  description = "The number of worker nodes to use for the cluster"
  type        = number
  default     = 2
}
variable "min_node_count" {
  description = "The minimum number of worker nodes to use for the cluster if autoscaling is enabled"
  type        = number
  default     = null
}
variable "max_node_count" {
  description = "The maximum number of worker nodes to use for the cluster if autoscaling is enabled"
  type        = number
  default     = null
}
// ----------------------------------------------------------------------------
// Machine learning nodepool variables
// ----------------------------------------------------------------------------
variable "ml_node_size" {
  type        = string
  default     = ""
  description = "The size of the ML node to use for the cluster"
}
variable "ml_node_count" {
  description = "The number of ML nodes to use for the cluster"
  type        = number
  default     = null
}
variable "min_ml_node_count" {
  description = "The minimum number of ML nodes to use for the cluster if autoscaling is enabled"
  type        = number
  default     = null
}
variable "max_ml_node_count" {
  description = "The maximum number of ML nodes to use for the cluster if autoscaling is enabled"
  type        = number
  default     = null
}

// ----------------------------------------------------------------------------
// Build nodepool variables
// ----------------------------------------------------------------------------
variable "use_spot" {
  type        = bool
  default     = true
  description = "Should we use spot instances for the build nodes"
}
variable "spot_max_price" {
  type        = number
  default     = -1
  description = "The maximum price you're willing to pay in USD per virtual machine, -1 to go to the maximum price"
}
variable "build_node_size" {
  type        = string
  default     = ""
  description = "The size of the build node to use for the cluster"
}
variable "build_node_count" {
  description = "The number of build nodes to use for the cluster"
  type        = number
  default     = null
}
variable "min_build_node_count" {
  description = "The minimum number of builder nodes to use for the cluster if autoscaling is enabled"
  type        = number
  default     = null
}
variable "max_build_node_count" {
  description = "The maximum number of builder nodes to use for the cluster if autoscaling is enabled"
  type        = number
  default     = null
}

// ----------------------------------------------------------------------------
// Cluster variables
// ----------------------------------------------------------------------------
variable "dns_prefix" {
  type        = string
  default     = ""
  description = "DNS prefix for the cluster. The script will create a random name if this is empty"
}
variable "cluster_version" {
  type        = string
  default     = "1.26.6"
  description = "Kubernetes version to use for the AKS cluster"
}
variable "network_resource_group_name" {
  type        = string
  default     = ""
  description = "The name of the resource group in to which to provision network resources. The script will create a random name if this is empty"
}
variable "cluster_resource_group_name" {
  type        = string
  default     = ""
  description = "The name of the resource group in to which to provision AKS managed cluster. The script will create a random name if this is empty"
}
variable "cluster_node_resource_group_name" {
  type        = string
  default     = ""
  description = "Resource group name in which to provision AKS cluster nodes. The script will create a random name if this is empty"
}
variable "vnet_cidr" {
  type        = string
  default     = "10.8.0.0/16"
  description = "The CIDR of the provisioned Virtual Network in Azure in to which worker nodes are placed"
}
variable "subnet_cidr" {
  type        = string
  default     = "10.8.0.0/24"
  description = "The CIDR of the provisioned  subnet within the `vnet_cidr` to to which worker nodes are placed"
}
variable "network_name" {
  type        = string
  default     = ""
  description = "The name of the Virtual Network in Azure to be created. The script will create a random name if this is empty"
}
variable "cluster_network_model" {
  type        = string
  default     = "kubenet"
  description = "Variable to define the network model for the cluster. Valid values are either `kubenet` or `azure`"
}
variable "subnet_name" {
  type        = string
  default     = ""
  description = "The name of the subnet in Azure to be created. The script will create a random name if this is empty"
}
variable "enable_log_analytics" {
  type        = bool
  default     = false
  description = "Flag to indicate whether to enable Log Analytics integration for cluster"
}
variable "logging_retention_days" {
  type        = number
  default     = 30
  description = "Number of days to retain logs in Log Analytics if enabled"
}

// ----------------------------------------------------------------------------
// DNS variables
// ---------------------------------------------------------------------------

variable "apex_domain_integration_enabled" {
  type        = bool
  default     = true
  description = "Flag that when set attempts to create delegation records in apex domain to point to domain created by this module"
}
variable "dns_enabled" {
  type        = bool
  default     = false
  description = "** Deprecated** Set apex_domain instead"
}
variable "apex_domain" {
  type        = string
  description = "The parent / apex domain to be used for the cluster"
  default     = ""
}
variable "apex_domain_name" {
  type        = string
  description = "**Deprecated** Please use apex_domain instead"
  default     = ""
}
variable "domain_name" {
  type        = string
  description = "**Deprecated** Please use subdomain instead"
  default     = ""
}
variable "subdomain" {
  description = "Optional sub domain for the installation"
  type        = string
  default     = ""
}
variable "apex_resource_group_name" {
  type        = string
  description = "The resource group in which the Azure DNS apex domain resides. Required if apex_domain_integration_enabled is true"
  default     = ""
}
variable "dns_resource_group_name" {
  type        = string
  description = "Resource group in which to create the Azure DNS zone. The script will create a random name if this is empty"
  default     = ""
}

// ----------------------------------------------------------------------------
// Secret storage variables
// ---------------------------------------------------------------------------

variable "key_vault_enabled" {
  type        = string
  description = "Flag to indicate whether to provision Azure Key Vault for secret storage"
  default     = true
}
variable "key_vault_resource_group_name" {
  type        = string
  description = "Resource group to create in which to place key vault"
  default     = ""
}
variable "key_vault_name" {
  type        = string
  description = "Name of Azure Key Vault to create"
  default     = ""
}
variable "key_vault_sku" {
  type        = string
  description = "SKU of the Key Vault resource to create. Valid values are standard or premium"
  default     = "standard"
}

// -----------------------------------------------------------------------------
// Container registry variables
// -----------------------------------------------------------------------------
variable "registry_resource_group_name" {
  type        = string
  default     = ""
  description = "The name of the resource group in to which to provision ACR managed registry. The script will create a random name if this is empty"
}
variable "use_existing_acr_name" {
  description = "Name of the existing ACR that you would like to use, e.g. use this in multicluster setup, when you want to use DEV cluster ACR."
  type        = string
  default     = null
}

variable "use_existing_acr_resource_group_name" {
  description = "Name of the resources group of the existing ACR that you would like to use, e.g. use this in multicluster setup, when you want to use DEV cluster ACR."
  type        = string
  default     = null
}



// ----------------------------------------------------------------------------
// Storage variables
// ---------------------------------------------------------------------------

variable "storage_resource_group_name" {
  type        = string
  description = "Resource group to create in which to place storage accounts"
  default     = ""
}
