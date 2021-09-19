
resource "azurerm_resource_group" "main" {
  name     = "ucm-${terraform.workspace}-rg"
  location = var.location
}

# module "virtual_network" {
#   source = "./modules/networking"

#   resource_group_name = azurerm_resource_group.main.name
#   location            = azurerm_resource_group.main.location
#   network_cidr_block  = "10.0.0.0/16"
#   subnet_cidr_blocks = [
#     "10.0.0.0/20",
#     "10.0.16.0/20",
#     "10.0.32.0/20"
#   ]
# }

module "vnet" {
  source  = "Azure/vnet/azurerm"
  version = "2.5.0"

  resource_group_name = azurerm_resource_group.main.name
  address_space       = ["10.0.0.0/16"]
  subnet_prefixes     = ["10.0.0.0/20", "10.0.16.0/20", "10.0.32.0/20"]
  subnet_names        = ["subnet1", "subnet2", "subnet3"]

  tags = {
    environment = terraform.workspace
    costcenter  = "it"
  }

  depends_on = [
    azurerm_resource_group.main
  ]
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                    = "aks"
  resource_group_name     = azurerm_resource_group.main.name
  dns_prefix              = "aks-dns"
  kubernetes_version      = var.kubernetes_version
  location                = azurerm_resource_group.main.location
  private_cluster_enabled = false
  sku_tier                = "Free"
  tags                    = {}

  addon_profile {
    azure_policy {
      enabled = false
    }

    http_application_routing {
      enabled = true
    }
  }

  default_node_pool {
    enable_auto_scaling   = false
    enable_node_public_ip = false
    max_pods              = 110
    name                  = "agentpool"
    node_count            = 1
    orchestrator_version  = var.kubernetes_version
    tags                  = {}
    type                  = "VirtualMachineScaleSets"
    vm_size               = "Standard_B4ms"
    vnet_subnet_id        = module.vnet.vnet_subnets[0]
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    dns_service_ip     = "10.1.0.10"
    docker_bridge_cidr = "172.17.0.1/16"
    load_balancer_sku  = "Standard"
    network_plugin     = "azure"
    outbound_type      = "loadBalancer"
    service_cidr       = "10.1.0.0/16"

    load_balancer_profile {
      idle_timeout_in_minutes   = 15
      managed_outbound_ip_count = 1
      outbound_ports_allocated  = 0
    }
  }

  windows_profile {
    admin_username = var.windows_profile_admin_username
    admin_password = var.windows_profile_admin_password
  }
}

/*
module "aks" {
  source  = "Azure/aks/azurerm"
  version = "4.13.0"

  resource_group_name  = azurerm_resource_group.main.name
  agents_max_count     = 2
  agents_min_count     = 1
  kubernetes_version   = "1.21.2"
  orchestrator_version = "1.21.2"
  prefix               = "dev"
  vnet_subnet_id       = module.vnet.vnet_subnets[0]

  depends_on = [module.vnet]
}
*/
