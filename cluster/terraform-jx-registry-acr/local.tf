locals {
  resource_group_name     = var.resource_group_name != "" ? var.resource_group_name : "rg-registry-${join("", regexall("[A-Za-z0-9\\-_().]", var.cluster_name))}"
  container_registry_name = var.container_registry_name != "" ? var.container_registry_name : substr(join("", regexall("[A-Za-z0-9]", var.cluster_name)), 0, 45)
}
