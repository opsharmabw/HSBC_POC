terraform {
  backend "gcs" {
    bucket  = "my-gke-terraform-state"
    prefix  = "gke-private/terraform.tfstate"
  }
}
