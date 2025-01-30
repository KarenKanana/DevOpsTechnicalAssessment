terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.10.5"
}

provider "google" {
  project = var.project_id
  region  = var.region
}
