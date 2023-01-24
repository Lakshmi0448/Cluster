provider "google" {
  project = var.gcp_project_id
  region  = var.region
}

terraform {
  backend "gcs" {
    bucket = "terraform-backend-storage-bucket"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}