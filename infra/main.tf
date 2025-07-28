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

module "bootstrap" {
  source      = "./modules/bootstrap"
  project_id  = var.project_id
  region      = var.region
  github_repo = var.github_repo
  repo_name   = var.repo_name
}

module "backend" {
  source            = "./modules/backend"
  backend_image_tag = var.backend_image_tag
  depends_on = [ module.bootstrap ]
}

module "frontend" {
  source             = "./modules/frontend"
  frontend_image_tag = var.frontend_image_tag
  depends_on = [ module.backend ]
}

# resource "google_storage_bucket" "terraform_state" {
#   name     = "cartwish-terraform-state"  # mora biti globalno jedinstveno
#   location = "EU"
#   force_destroy = true

  

#   versioning {
#     enabled = true
#   }
# }