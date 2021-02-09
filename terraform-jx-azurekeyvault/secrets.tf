resource "azurerm_key_vault_secret" "secret" {
  depends_on   = [azurerm_key_vault_access_policy.terraform]
  for_each     = local.secret_map
  name         = each.key
  value        = each.value
  key_vault_id = azurerm_key_vault.jx.0.id
}
