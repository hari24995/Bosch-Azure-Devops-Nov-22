resource "azurerm_virtual_network" "my-vnet" {
  name = "my-vnet"
  location = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  address_space = ["10.10.65.0/24"]
}
