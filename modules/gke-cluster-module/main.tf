data "google_client_config" "default" {}

resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region
  # monitoring_service = "none"
  # logging_service = "none"

  # logging_service    = "none"         
  # monitoring_service = "monitoring.googleapis.com/kubernetes"
  node_config {
    machine_type = var.machine_type
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
    disk_size_gb = 40
  }
  monitoring_config {
    managed_prometheus {
      enabled = true
    }
  }
  initial_node_count = var.node_count
  remove_default_node_pool = true
  deletion_protection = false
  # provisioner "local-exec" {
  #   command = "gcloud container clusters get-credentials ${var.cluster_name} --zone ${var.region}"
  # }
}

resource "google_container_node_pool" "primary_nodes" {
  cluster  = google_container_cluster.primary.name
  name = "primary-node-pool"
  location = google_container_cluster.primary.location
  # node_count = 1

  node_config {
    preemptible = true
    machine_type = var.machine_type 
    disk_size_gb = 40

    oauth_scopes  = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  initial_node_count = var.node_count
  
}


