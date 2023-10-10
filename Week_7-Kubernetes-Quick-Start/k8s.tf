resource "digitalocean_kubernetes_cluster" "django" {
  name    = "django"
  region  = "nyc1"
  version = "1.28.2-do.0"

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-2gb"
    node_count = 2
  }
}
