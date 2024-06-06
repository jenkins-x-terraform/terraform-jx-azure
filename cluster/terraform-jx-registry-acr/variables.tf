variable "external_registry_url" {
  description = "If present, will not create acr and instead use an external registry."
  type        = string
}
variable "cluster_name" {
  description = "Name of the cluster, used to autogenerate some variables if they are not supplied"
  type        = string
}
variable "container_registry_name" {
  description = "Name of container registry"
  type        = string
  default     = ""
}
variable "resource_group_name" {
  description = "Resource group in which to create registry"
  type        = string
  default     = ""
}
variable "location" {
  description = "Location in which to create registry"
  type        = string
  default     = "australiaeast"
}
variable "principal_id" {
  description = "Principal id of the identity to give authorisation to push/pull to container registry"
  type        = string
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

variable "acr_enabled" {
  description = "additional toggle to enable/disable acr creation"
  type        = string
}