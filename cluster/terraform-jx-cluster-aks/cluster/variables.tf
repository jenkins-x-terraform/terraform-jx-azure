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
  default     = null
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
variable "use_spot_ml" {
  type        = bool
  default     = true
  description = "Should we use spot instances for the ml nodes"
}

variable "spot_max_price_ml" {
  type        = number
  default     = -1
  description = "The maximum price you're willing to pay in USD per virtual machine, -1 to go to the maximum price"
}

variable "ml_node_size" {
  type        = string
  default     = ""
  description = "The size of the worker node to use for the cluster"
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
// Infra nodepool variables
// ----------------------------------------------------------------------------
variable "use_spot_infra" {
  type        = bool
  default     = true
  description = "Should we use spot instances for the infra nodes"
}
variable "spot_max_price_infra" {
  type        = number
  default     = -1
  description = "The maximum price you're willing to pay in USD per virtual machine, -1 to go to the maximum price"
}
variable "infra_node_size" {
  type        = string
  default     = ""
  description = "The size of the infra node to use for the cluster"
}
variable "infra_node_count" {
  description = "The number of infra nodes to use for the cluster"
  type        = number
  default     = null
}
variable "min_infra_node_count" {
  description = "The minimum number of infra nodes to use for the cluster if autoscaling is enabled"
  type        = number
  default     = null
}
variable "max_infra_node_count" {
  description = "The maximum number of infra nodes to use for the cluster if autoscaling is enabled"
  type        = number
  default     = null
}

// ----------------------------------------------------------------------------
// mlbuild nodepool variables
// ----------------------------------------------------------------------------
variable "use_spot_mlbuild" {
  type        = bool
  default     = true
  description = "Should we use spot instances for the mlbuild nodes"
}
variable "spot_max_price_mlbuild" {
  type        = number
  default     = -1
  description = "The maximum price you're willing to pay in USD per virtual machine, -1 to go to the maximum price"
}
variable "mlbuild_node_size" {
  type        = string
  default     = ""
  description = "The size of the mlbuild node to use for the cluster"
}
variable "mlbuild_node_count" {
  description = "The number of mlbuild nodes to use for the cluster"
  type        = number
  default     = null
}
variable "min_mlbuild_node_count" {
  description = "The minimum number of mlbuild nodes to use for the cluster if autoscaling is enabled"
  type        = number
  default     = null
}
variable "max_mlbuild_node_count" {
  description = "The maximum number of mlbuild nodes to use for the cluster if autoscaling is enabled"
  type        = number
  default     = null
}

// ----------------------------------------------------------------------------
// Cluster variables
// ----------------------------------------------------------------------------
variable "cluster_name" {
  type = string
}
variable "sku_tier" {
  description = "The SKU tier of the cluster to use (uptime SLA)."
  type = string
}
variable "cluster_version" {
  description = "Kubernetes version to use for the AKS cluster."
  type        = string
}
variable "location" {
  type = string
}
variable "vnet_subnet_id" {
  type = string
}
variable "dns_prefix" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "node_resource_group_name" {
  type = string
}
variable "network_resource_group" {
  type = string
}
variable "cluster_network_model" {
  type    = string
  default = "kubenet"
}
variable "enable_log_analytics" {
  type = bool
}
variable "logging_retention_days" {
  type = number
}

variable "azure_policy_bool" {
  type = bool
}


variable "microsoft_defender_log_analytics_name" {
  type = string
  default = "DefaultWorkspace-5429b748-8754-45b3-bbab-036e0cc418ee-SUK"
}

variable "microsoft_defender_log_id" {
  type = string
}

variable "defender_resource_group" {
  type = string
}

variable "enable_defender_analytics" {
  type = bool
}