output "acr_name" {
  value = azurerm_container_registry.this.name
}

output "acr_server" {
  value = azurerm_container_registry.this.login_server
}

# output "id" {
#   value = azurerm_kubernetes_cluster.this.id
# }

# output "kube_config" {
#   value = azurerm_kubernetes_cluster.this.kube_config_raw
#   sensitive = false
# }

# output "client_key" {
#   value = azurerm_kubernetes_cluster.this.kube_config.0.client_key
# }

# output "client_certificate" {
#   value = azurerm_kubernetes_cluster.this.kube_config.0.client_certificate
# }

# output "cluster_ca_certificate" {
#   value = azurerm_kubernetes_cluster.this.kube_config.0.cluster_ca_certificate
# }

# output "host" {
#   value = azurerm_kubernetes_cluster.this.kube_config.0.host
# }

