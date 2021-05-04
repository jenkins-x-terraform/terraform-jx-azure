locals {
  dns_prefix                       = var.dns_prefix != "" ? var.dns_prefix : "jx${substr(join("", regexall("[A-Za-z0-9\\-]", var.cluster_name)), 0, 39)}host"
  network_resource_group_name      = var.network_resource_group_name != "" ? var.network_resource_group_name : "rg-net-${join("", regexall("[A-Za-z0-9\\-_().]", var.cluster_name))}"
  cluster_resource_group_name      = var.cluster_resource_group_name != "" ? var.cluster_resource_group_name : "rg-cluster-${join("", regexall("[A-Za-z0-9\\-_().]", var.cluster_name))}"
  cluster_node_resource_group_name = var.cluster_node_resource_group_name != "" ? var.cluster_node_resource_group_name : "rg-cluster-node-${join("", regexall("[A-Za-z0-9\\-_().]", var.cluster_name))}"
  network_name                     = var.network_name != "" ? var.network_name : join("", regexall("[A-Za-z0-9\\-_.]", var.cluster_name))
  subnet_name                      = var.subnet_name != "" ? var.subnet_name : join("", regexall("[A-Za-z0-9\\-_.]", var.cluster_name))
}
