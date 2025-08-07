terraform {
  backend "gcs" {
    bucket  = "test-bucket-1-ommmsjnnmd"
    prefix  = "gke-private/terraform.tfstate"
  }
}
