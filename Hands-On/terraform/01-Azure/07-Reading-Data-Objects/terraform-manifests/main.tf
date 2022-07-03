data "azurerm_resource_group" "my_rg" {
  name = "rgtfstate"
}

# Random String Resource
resource "random_string" "myrandom" {
  length = 6
  upper = false
  special = false
  numeric = false
}

resource "azurerm_storage_account" "my_st" {
  name                     = "tfsttbsc${random_string.myrandom.id}"
  resource_group_name      = data.azurerm_resource_group.my_rg.name
  location                 = data.azurerm_resource_group.my_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = data.azurerm_resource_group.my_rg.tags
}
