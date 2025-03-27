# resource "azurerm_user_assigned_identity" "base" {
#   name                = "base"
#   location            = azurerm_resource_group.this.location
#   resource_group_name = azurerm_resource_group.this.name
# }

# resource "azurerm_role_assignment" "base" {
#   scope                = azurerm_resource_group.this.id
#   role_definition_name = "Captain Network"
#   principal_id         = azurerm_user_assigned_identity.base.principal_id
# }

resource "azurerm_container_registry" "this" {
  name                = "contyreggers"  # Must be globally unique
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location  # Adjust the region as necessary
  sku                  = "Basic"  # Other options are "Standard" and "Premium"

}


resource "azurerm_kubernetes_cluster" "this" {
    name                = var.cluster_name
    location            = azurerm_resource_group.this.location
    resource_group_name = azurerm_resource_group.this.name
    dns_prefix          = "tfcluster"

    kubernetes_version        = var.kubernetes_version
    // automatic_upgrade_channel = "none"
    private_cluster_enabled   = false
    node_resource_group       = "${azurerm_resource_group.this.name}-${var.cluster_name}-nodes"

    # It's in Preview
    # api_server_access_profile {
    #   vnet_integration_enabled = true
    #   subnet_id                = azurerm_subnet.subnet1.id
    # }

    # For production change to "Standard" 
    sku_tier = "Free"

    # System node pool
  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

}

resource "azurerm_kubernetes_cluster_node_pool" "spot" {
  name                  = "spot"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.this.id
  vm_size               = "Standard_DS2_v2"
  //vnet_subnet_id        = azurerm_subnet.nodesubnet.id
  priority              = "Spot"
  spot_max_price        = -1
  eviction_policy       = "Delete"
  node_count            = 1

  node_labels = {
    "kubernetes.azure.com/scalesetpriority" = "spot"
  }

  node_taints = [
    "kubernetes.azure.com/scalesetpriority=spot:NoSchedule"
  ]

}

resource "azurerm_role_assignment" "this" {
  principal_id                     = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.this.id
  skip_service_principal_aad_check = true
}

