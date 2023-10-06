
data "digitalocean_kubernetes_versions" "version" {
  version_prefix = local.config.cluster_version
}
# Deploy the actual Kubernetes cluster
resource "digitalocean_kubernetes_cluster" "vkpr-cluster" {
  name    = local.config.cluster_name
  region  = local.config.cluster_region
  version = data.digitalocean_kubernetes_versions.version.latest_version
  tags    = local.config.tags
  # This default node pool is mandatory
  node_pool {
    name       = "default-pool"
    size       = local.config.default_pool_size# minimum size, list available options with `doctl compute size list`
    auto_scale = false
    node_count = local.config.node_count
    
  }
} 

# Another node pool for applications
resource "digitalocean_kubernetes_node_pool" "app_node_pool" {
  cluster_id = digitalocean_kubernetes_cluster.vkpr-cluster.id
  name = "worker-node-pool"
  size = local.config.node_pool_size # bigger instances
  
  # you can setup autoscaling
  auto_scale = true
  min_nodes  = local.config.min_nodes
  max_nodes  = local.config.max_nodes
  tags       = local.config.tags
  labels = {
    service  = "apps"
    priority = "high"
  }
}
