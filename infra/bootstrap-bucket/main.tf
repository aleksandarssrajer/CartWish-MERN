terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.30.0"
    }
  }
}


resource "google_storage_bucket" "terraform_state" {
  project  = "sara-sandbox-interns"
  name     = "cartwish-terraform-state" # Unikatno ime za GCS
  location = "EU"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true # Štiti bucket od slučajnog brisanja
  }
}