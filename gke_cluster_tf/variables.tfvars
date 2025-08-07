project_id               = "custom-sun-468208-s1"
region                   = "asia-east2"
zone                     = "asia-east2-a"

network_name             = "custom-network"
subnet_name              = "custom-subnet"

pod_range_name           = "pods"
service_range_name       = "services"
master_ipv4_cidr         = "172.16.0.0/28"

authorized_network_cidr  = "10.10.0.0/16"
authorized_network_name  = "trusted-network"

node_count = 3
machine_type = "e2-highmem-2"