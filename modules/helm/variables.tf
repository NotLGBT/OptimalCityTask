variable "project_id" {
  description = "The project ID to deploy the cluster in"
  type        = string
}

variable "region" {
  description = "The region to deploy the cluster in"
  type        = string
}

variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
  default     = "example-cluster"
}

variable "node_count" {
  description = "Number of nodes in the cluster"
  type        = number
  default     = 3
}

variable "machine_type" {
  description = "Machine type for the cluster nodes"
  type        = string
  default     = "e2-medium"
}

variable "namespace" {
  description = "Namespace in which to deploy the Helm chart"
  type        = string
  default     = "default"
}

variable "chart_name" {
  description = "The name of the Helm chart to deploy"
  type        = string
}

variable "helm_repo_url" {
  description = "URL of the Helm chart repository"
  type        = string
}

variable "cluster" {
  description = "Name of cluster"
  type = string 
  
}