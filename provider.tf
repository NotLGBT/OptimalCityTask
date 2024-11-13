# terraform {
#   required_providers {
#     google = {
#       source = "hashicorp/google"
#       version = "6.10.0"
#     }
#   }
# }


provider "google" {
  project = "aqueous-sandbox-432016-j4"
  region  = "europe-central2"

}

provider "kubernetes" {
  host                   = module.google_container_cluster.primary.endpoint
  cluster_ca_certificate = base64decode(module.google_container_cluster.primary.master_auth.0.cluster_ca_certificate)
  token                  = data.google_client_config.current.access_token
}

provider "helm" {
  kubernetes {
    config_path = "/home/runner/config" 
  }
}