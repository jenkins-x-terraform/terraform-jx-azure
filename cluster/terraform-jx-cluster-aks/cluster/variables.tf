// ----------------------------------------------------------------------------
// Machine variables
// ----------------------------------------------------------------------------
variable "node_size" {
  type        = string
  default     = "Standard_B2ms"
  description = "The size of the worker node to use for the cluster"
}
variable "min_node_count" {
  description = "The number of worker nodes to use for the cluster"
  type        = number
  default     = 2
}
variable "max_node_count" {
  description = "The number of worker nodes to use for the cluster"
  type        = number
  default     = 2
}
variable "ml_node_size" {
  type        = string
  default     = "Standard_B2ms"
  description = "The size of the worker node to use for the cluster"
}
variable "min_ml_node_count" {
  description = "The number of worker nodes to use for the cluster"
  type        = number
  default     = 2
}
variable "max_ml_node_count" {
  description = "The number of worker nodes to use for the cluster"
  type        = number
  default     = 2
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
