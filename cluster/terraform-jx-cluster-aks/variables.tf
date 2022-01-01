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
  type    = string
  default = ""
}
variable "dns_prefix" {
  type    = string
  default = ""
}
variable "cluster_version" {
  type    = string
  default = "1.20.9"
}
variable "location" {
  type    = string
  default = "australiaeast"
}
variable "network_resource_group_name" {
  type    = string
  default = ""
}
variable "cluster_resource_group_name" {
  type    = string
  default = ""
}
variable "cluster_node_resource_group_name" {
  type    = string
  default = ""
}
variable "vnet_cidr" {
  type    = string
  default = "10.8.0.0/16"
}
variable "subnet_cidr" {
  type    = string
  default = "10.8.0.0/24"
}
variable "network_name" {
  type    = string
  default = ""
}
variable "cluster_network_model" {
  type    = string
  default = "kubenet"
}
variable "subnet_name" {
  type    = string
  default = ""
}
variable "enable_log_analytics" {
  type    = bool
  default = false
}
variable "logging_retention_days" {
  type    = number
  default = 30
}
variable "active_directory_admin_group_ids" {
  type = list
  default = null
}
