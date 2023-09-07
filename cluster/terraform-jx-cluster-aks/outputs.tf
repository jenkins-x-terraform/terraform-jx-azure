output "connect" {
  value = "az aks get-credentials --subscription ${data.azurerm_subscription.current.subscription_id} --name ${var.cluster_name} --resource-group ${local.cluster_resource_group_name} --admin"
}
output "kubelet_identity_id" {
  value = module.cluster.kubelet_identity_id
}
output "kubelet_client_id" {
  value = module.cluster.kubelet_client_id
}
output "cluster_endpoint" {
  value = module.cluster.cluster_endpoint
}
output "client_certificate" {
  value = module.cluster.client_certificate
}
output "client_key" {
  value = module.cluster.client_key
}
output "ca_certificate" {
  value = module.cluster.ca_certificate
}
output "kube_config_admin_raw" {
  value = module.cluster.kube_config_admin_raw
}
output "kube_config_admin" {
  value = module.cluster.kube_config_admin
}
output "microsoft_defender_log_id" {
  value = module.cluster.microsoft_defender_log_id
}
