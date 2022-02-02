resource "azurerm_storage_account" "storage01" {
  name                     = "firststorage01"
  resource_group_name      = azurerm_resource_group.RG_01.name
  location                 = azurerm_resource_group.RG_01.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}