output "vault_instance_release_id" {
  value = var.install_vault ? helm_release.vault-instance.0.id : ""
}
