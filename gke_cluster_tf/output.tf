output "cluster_name" {
  value = google_container_cluster.private_cluster.name
}

output "endpoint" {
  value = google_container_cluster.private_cluster.endpoint
}

output "master_version" {
  value = google_container_cluster.private_cluster.min_master_version
}
