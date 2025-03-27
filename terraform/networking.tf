# resource "azurerm_virtual_network" "this" {
#   name                = "tfvnet"
#   address_space       = ["10.0.0.0/16"]
#   location            = azurerm_resource_group.this.location
#   resource_group_name = azurerm_resource_group.this.name

#   tags = {
#     env = "dev"
#   }
# }
# resource "azurerm_subnet" "nodesubnet" {
#   name                 = "nodesubnet"
#   address_prefixes     = ["10.0.0.0/19"]
#   resource_group_name  = azurerm_resource_group.this.name
#   virtual_network_name = azurerm_virtual_network.this.name
# }

# resource "azurerm_subnet" "othersubnet" {
#   name                 = "othersubnet"
#   address_prefixes     = ["10.0.32.0/19"]
#   resource_group_name  = azurerm_resource_group.this.name
#   virtual_network_name = azurerm_virtual_network.this.name
# }

