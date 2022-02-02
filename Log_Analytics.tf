resource "azurerm_log_analytics_workspace" "LOG_01" {
  name                = "acctest-01"
  location            = azurerm_resource_group.RG_01.location
  resource_group_name = azurerm_resource_group.RG_01.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}