variable "project_id" {
  type        = string
}

variable "region" {
  type        = string
}

variable "cluster_name" {
  type        = string
}

variable "node_count" {
  type        = number
  default     = 3
}

variable "machine_type" {
  type        = string
  default     = "n1-standard-1"
}

variable "network" {
  type        = string
}

variable "subnetwork" {
  type        = string
}

variable "node_labels" {
  type        = map(string)
  default     = {}
}

variable "node_tags" {
  type        = list(string)
  default     = []
}

variable "enable_autoscaling" {
  type        = bool
  default     = false
}

variable "min_node_count" {
  type        = number
  default     = 1
}

variable "max_node_count" {
  type        = number
  default     = 5
}

variable "enable_network_policy" {
  type        = bool
  default     = false
}

variable "enable_private_nodes" {
  type        = bool
  default     = false
}

variable "master_ipv4_cidr_block" {
  type        = string
  default     = "172.16.0.0/28"
}
