
# module "bucket" {
#   source ="./modules/cloud-storage"
# }
# module "gke_cluster" {
#   source         = "./modules/gke-cluster-module"  
#   project_id     = "aqueous-sandbox-432016-j4"
#   region         = "europe-central2"
#   cluster_name   = "my-gke-cluster"
#   node_count     = 1
#   machine_type   = "n1-standard-1"
#   network        = "default"
#   subnetwork     = "default"


#   enable_autoscaling = false
#   min_node_count     = 1
#   max_node_count     = 1
#   enable_network_policy = true
#   enable_private_nodes = false
#   master_ipv4_cidr_block = "172.16.0.0/28"
  
# }

module "python_app" {
    source = "./modules/python-app"
} 

module "helm_release" {
  source = "./modules/helm"
  project_id = "aqueous-sandbox-432016-j4"
  chart_name = "python-app"
  helm_repo_url = "https://notlgbt.github.io/optimalcitytask"
  region = "europe-central2"
  cluster = "my-gke-cluster"

}

