variable "resource_group_name" {
  type        = string
  description = "The name of the Azure resource group to create all resources"
}
variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
  type        = string
}
variable "apex_domain" {
  type        = string
  description = "The apex domain to be allocated to the cluster"
}
variable "apex_resource_group_name" {
  type        = string
  description = "The Azure resource group the apex domain is managed by, used to write recordsets for a subdomain if set.  Defaults to current project."
  default     = ""
}
variable "apex_domain_integration_enabled" {
  type        = bool
  default     = false
  description = "Flag that when set attempts to create delegation records in apex domain to point to domain created by this module"
}
variable "subdomain" {
  type        = string
  description = "Optional sub domain for the installation"
}
variable "principal_id" {
  type        = string
  description = "The Azure AD principal identity to give Contributor permissions on the Azure DNS zone to"
}
variable "location" {
  type        = string
  default     = "centralindia"
  description = "The Azure location in which to create the DNS zone"
}
