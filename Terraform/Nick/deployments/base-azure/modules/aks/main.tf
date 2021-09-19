
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  dns_prefix          = "aks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }
}
