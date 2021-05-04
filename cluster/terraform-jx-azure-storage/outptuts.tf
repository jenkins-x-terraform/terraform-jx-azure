output "log_container_name" {
  value = azurerm_storage_container.logs.name
}
output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}
