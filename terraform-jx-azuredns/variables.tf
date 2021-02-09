variable "cluster_name" {
  description = "Name of the cluster, used to autogenerate some variables if they are not supplied"
  type        = string
}
variable "apex_domain_integration_enabled" {
  type        = bool
  default     = false
  description = "Flag that when set attempts to create delegation records in apex domain to point to domain created by this module"
}
variable "enabled" {
  type        = bool
  default     = false
  description = "Flag that when set creates an Azure DNS zone for JX"
}
variable "apex_domain_name" {
  type        = string
  description = "The name of the parent/apex domain in which to create this domain zone, e.g. jenkins-x.io"
}
variable "domain_name" {
  type        = string
  description = "The domain name of the zone to create, e.g. dev-subdomain"
}
variable "apex_resource_group_name" {
  type        = string
  description = "The resource group in which the Azure DNS apex domain resides. Required if apex_domain_integration_enabled is true"
  default     = ""
}
variable "resource_group_name" {
  type        = string
  description = "Resource group in which to create the Azure DNS zone"
}
variable "principal_id" {
  type        = string
  description = "The Azure AD principal identity to give Contributor permissions on the Azure DNS zone to"
}
variable "location" {
  type        = string
  default     = "australiaeast"
  description = "The Azure location in which to create the DNS zone"
}
