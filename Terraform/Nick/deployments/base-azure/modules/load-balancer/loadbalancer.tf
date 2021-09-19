
resource "azurerm_public_ip" "cashmoney" {
  name                = "PublicIPForLB"
  location            = "East US"
  resource_group_name = azurerm_resource_group.cashmoney.name
  allocation_method   = "Static"
}

resource "azurerm_lb" "cashmoney" {
  name                = "LoadBalancer"
  location            = "East US"
  resource_group_name = azurerm_resource_group.cashmoney.name
  sku                 = "Basic"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.cashmoney.id
  }
}
