output "fqdn" {
  value = azurerm_kubernetes_cluster.aks.fqdn
}
output "cluster_endpoint" {
  value = azurerm_kubernetes_cluster.aks.kube_admin_config.0.host
}
output "client_certificate" {
  value = azurerm_kubernetes_cluster.aks.kube_admin_config.0.client_certificate
}
output "client_key" {
  value = azurerm_kubernetes_cluster.aks.kube_admin_config.0.client_key
}
output "ca_certificate" {
  value = azurerm_kubernetes_cluster.aks.kube_admin_config.0.cluster_ca_certificate
}
output "kube_config_admin_raw" {
  value = azurerm_kubernetes_cluster.aks.kube_admin_config_raw
}
output "kube_config_admin" {
  value = azurerm_kubernetes_cluster.aks.kube_admin_config
}
output "node_resource_group" {
  value = azurerm_kubernetes_cluster.aks.node_resource_group
}
output "kubelet_identity_id" {
  value = azurerm_kubernetes_cluster.aks.kubelet_identity.0.object_id
}
output "kubelet_client_id" {
  value = azurerm_kubernetes_cluster.aks.kubelet_identity.0.client_id
}
output "kubernetes_cluster" {
  value = azurerm_kubernetes_cluster.aks
}
output "microsoft_defender_log_id" {
  value = azurerm_log_analytics_workspace.microsoft_defender.id
}
