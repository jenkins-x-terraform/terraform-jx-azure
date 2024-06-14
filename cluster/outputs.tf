output "registry_name" {
  value = module.registry.registry_name
}

output "registry_name_acr" {
  value = module.registry.registry_name_acr
}

output "resource_group_name" {
  value = module.registry.resource_group_name
}

output "kubelet_identity_id" {
  value = module.cluster.kubelet_identity_id
}
output "kubelet_client_id" {
  value = module.cluster.kubelet_client_id
}