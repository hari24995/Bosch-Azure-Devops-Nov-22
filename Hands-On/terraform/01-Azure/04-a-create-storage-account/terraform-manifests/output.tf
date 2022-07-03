output "storage_account_name" {
  description = "Storage account name"
  # Atrribute Reference
  value = azurerm_storage_account.my_storageaccount.name
}
