output "gke_cluster_endpoint" {
  value = module.gke_cluster.cluster_endpoint
}

output "gke_cluster_ca_certificate" {
  value = module.gke_cluster.cluster_ca_certificate
}