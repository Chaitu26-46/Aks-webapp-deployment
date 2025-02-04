provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "aks-webapp-rg"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-webapp-cluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "akswebapp"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}