// ----------------------------------------------------------------------------
// Machine variables
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
// Cluster variables
// ----------------------------------------------------------------------------
variable "cluster_name" {
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
variable "active_directory_admin_group_ids" {
  type = list
}