
resource "azurerm_virtual_network" "virtual_network" {
  name                = "virtual_network"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
}

resource "azurerm_subnet" "subnets" {
  count = length(var.subnet_cidr_blocks)

  name                 = "subnet${count.index + 1}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = [var.subnet_cidr_blocks[count.index]]
}
