terraform {
  backend "gcs" {
    bucket  = "cartwish-terraform-state"
    prefix  = "terraform/state"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.30"
    }
  }
}

provider "google" {
  project = "sara-sandbox-interns"
  region  = "europe-west1"
}

resource "google_storage_bucket" "tf_state" {
  name     = "cartwish-terraform-state"  # mora biti globalno jedinstveno
  location = "EU"
  force_destroy = true

  versioning {
    enabled = true
  }
}