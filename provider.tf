provider "google" {
  project = "kubernetes-project-375706"
  region  = "asia-south1"
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