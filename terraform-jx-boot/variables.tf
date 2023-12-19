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
variable "terraform_drift_secret_map" {
  type        = map(string)
  default     = {}
  description = "Map of environment secrets to pass to Terraform drift health check"
}
variable "job_secret_env_vars" {
  type        = map(string)
  default     = {}
  description = "Map of environment secrets to set on git operator boot jobs"
}
variable "install_vault" {
  type        = bool
  default     = false
  description = "Flag to indicate whether to install Hashicorp Vault charts"
}
variable "operator_annotations" {
  type        = map(string)
  default     = {}
  description = "Annotations to apply to jx git operator chart"
}

variable "install_kuberhealthy" {
  description = "Flag to specify if kuberhealthy operator should be installed"
  type        = bool
  default     = false
}
