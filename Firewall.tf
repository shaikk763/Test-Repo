resource "azurerm_virtual_network" "VNET_02" {
  name                = "testvnet"
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.RG_01.location
  resource_group_name = azurerm_resource_group.RG_01.name
}

resource "azurerm_subnet" "firewallsubnet" {
  name                 = "AzureFireWallSubnet"
  resource_group_name  = azurerm_resource_group.RG_01.name
  virtual_network_name = azurerm_virtual_network.VNET_02.name
  address_prefixes     = ["10.1.2.0/24"]
}

resource "azurerm_public_ip" "pip_01" {
  name                = "testpip"
  location            = azurerm_resource_group.RG_01.location
  resource_group_name = azurerm_resource_group.RG_01.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "azure_firewall" {
  name                = "testfirewall"
  location            = azurerm_resource_group.RG_01.location
  resource_group_name = azurerm_resource_group.RG_01.name

  ip_configuration {
    name                 = "ip-configuration"
    subnet_id            = azurerm_subnet.firewallsubnet.id
    public_ip_address_id = azurerm_public_ip.pip_01.id
  }
}