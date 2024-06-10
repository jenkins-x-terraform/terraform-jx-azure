variable "cluster_name" {
  type = string
}
variable "enabled" {
  type        = string
  description = "Flag to indicate whether to provision Azure Key Vault for secret storage"
  default     = false
}
variable "location" {
  type    = string
  default = "australiaeast"
}
variable "resource_group_name" {
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
variable "principal_id" {
  type        = string
  description = "The id of the service principal that should be granted permission on the key vault"
}
variable "kubelet_client_id" {
    type        = string
    description = "The client id of the kubelet identity used when authenticating to the key vault"
}
variable "secret_map" {
  type        = map(string)
  description = "Map of secret keys and values to store in Azure Key Vault"
}
