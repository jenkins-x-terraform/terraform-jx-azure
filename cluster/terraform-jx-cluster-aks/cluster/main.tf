resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  node_resource_group = var.node_resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.cluster_version

  default_node_pool {
    name                 = "default"
    vm_size              = var.node_size
    vnet_subnet_id       = var.vnet_subnet_id
    node_count           = var.node_count
    min_count            = var.min_node_count
    max_count            = var.max_node_count
    orchestrator_version = var.cluster_version
    enable_auto_scaling  = var.max_node_count == null ? false : true
  }

  network_profile {
    network_plugin = var.cluster_network_model
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control {
    enabled = true

    azure_active_directory {
      managed = true
    }
  }

  addon_profile {
    dynamic "oms_agent" {
      for_each = var.enable_log_analytics ? [""] : []
      content {
        enabled                    = var.enable_log_analytics
        log_analytics_workspace_id = var.enable_log_analytics ? azurerm_log_analytics_workspace.cluster[0].id : ""
      }
    }
    aci_connector_linux {
      enabled = false
    }
    azure_policy {
      enabled = false
    }
    http_application_routing {
      enabled = false
    }
    kube_dashboard {
      enabled = false
    }
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "mlnode" {
  count                = var.ml_node_size == "" ? 0 : 1
  name                 = "mlnode"
  kubernetes_cluster_id= azurerm_kubernetes_cluster.aks.id
  vm_size              = var.ml_node_size
  vnet_subnet_id       = var.vnet_subnet_id
  node_count           = var.ml_node_count
  min_count            = var.min_ml_node_count
  max_count            = var.max_ml_node_count
  orchestrator_version = var.cluster_version
  enable_auto_scaling  = var.max_ml_node_count == null ? false : true
}
