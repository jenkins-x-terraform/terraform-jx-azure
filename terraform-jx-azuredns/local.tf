locals {
  resource_group_name = var.resource_group_name != "" ? var.resource_group_name : "rg-dns-${join("", regexall("[A-Za-z0-9\\-_().]", var.cluster_name))}"
  enabled             = var.apex_domain != ""
  with_subdomain      = var.subdomain != ""
}
