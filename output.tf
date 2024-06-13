output "registry_name" {
  value = module.cluster.registry_name
}

output "resource_group_name" {
  value = module.cluster.resource_group_name
}

output "kubelet_identity_id" {
  value = module.cluster.kubelet_identity_id
}
output "kubelet_client_id" {
  value = module.cluster.kubelet_client_id
}