# Project & Region
variable "project_id" {
     type = string 
     }
variable "region"     {
     type = string 
     }
variable "zone"       {
     type = string 
     }

# Networking
variable "network_name" {
     type = string 
     }
variable "subnet_name"  {
     type = string 
     }

# Cluster Configuration
variable "cluster_name" {
  type    = string
  default = "gke-private-cluster"
}

variable "release_channel" {
  type    = string
  default = "REGULAR"
}

variable "pod_range_name" {
  type = string
}

variable "service_range_name" {
  type = string
}

variable "master_ipv4_cidr" {
  type = string
}

variable "enable_private_endpoint" {
  type    = bool
  default = true
}

# Access Control
variable "authorized_network_cidr" {
  type = string
}

variable "authorized_network_name" {
  type = string
}

# Node Pool Configuration
variable "node_pool_name" {
  type    = string
  default = "private-node-pool"
}

variable "node_count" {
  type    = number
  default = 1
}

variable "machine_type" {
  type    = string
  default = "e2-medium"
}

variable "disk_size" {
  type    = number
  default = 50
}

variable "disk_type" {
  type    = string
  default = "pd-standard"
}

variable "oauth_scopes" {
  type    = list(string)
  default = ["https://www.googleapis.com/auth/cloud-platform"]
}

variable "environment" {
  type    = string
  default = "demo"
}

variable "node_tags" {
  type    = list(string)
  default = ["gke-private-nodes"]
}

variable "node_auto_upgrade" {
  type    = bool
  default = true
}

variable "node_auto_repair" {
  type    = bool
  default = true
}
