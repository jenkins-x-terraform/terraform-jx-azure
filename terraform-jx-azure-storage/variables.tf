variable "location" {
  type        = string
  default     = "centralindia"
  description = "The Azure region in to which to provision the cluster"
}
variable "resource_group_name" {
  type        = string
  description = "Resource group to create in which to place storage account"
  default     = ""
}
variable "cluster_name" {
  type = string
}
variable "storage_principal_id" {
  type        = string
  description = "The id of the service principal that should be granted permission on the storage account"
}
