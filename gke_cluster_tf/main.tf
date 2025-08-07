resource "google_container_cluster" "private_cluster" {
  name     = var.cluster_name
  location = var.zone

  network    = "https://www.googleapis.com/compute/v1/projects/${var.project_id}/global/networks/${var.network_name}"
  subnetwork = "https://www.googleapis.com/compute/v1/projects/${var.project_id}/regions/${var.region}/subnetworks/${var.subnet_name}"

  remove_default_node_pool = true
  deletion_protection = false
  initial_node_count = 1

  release_channel {
    channel = var.release_channel
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = var.pod_range_name
    services_secondary_range_name = var.service_range_name
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = var.enable_private_endpoint
    master_ipv4_cidr_block  = var.master_ipv4_cidr
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = var.authorized_network_cidr
      display_name = var.authorized_network_name
    }
  }

  enable_legacy_abac = false
}


# Node Pool

resource "google_container_node_pool" "private_nodes" {
  name     = var.node_pool_name
  cluster  = google_container_cluster.private_cluster.name
  location = var.zone

  node_count = var.node_count

  node_config {
    machine_type = var.machine_type
    disk_size_gb = var.disk_size
    disk_type    = var.disk_type

    oauth_scopes = var.oauth_scopes

    labels = {
      env = var.environment
    }

    tags = var.node_tags
  }

  management {
    auto_upgrade = var.node_auto_upgrade
    auto_repair  = var.node_auto_repair
  }
}
