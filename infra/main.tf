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
  source       = "./modules/frontend"
  project_id   = var.project_id
  region       = var.region
}

module "loadbalancer" {
  source                   = "./modules/loadbalancer"
  project_id               = var.project_id 
  frontend_bucket_name     = module.frontend.frontend_bucket_name
  backend_service_name     = module.backend.backend_service_name
  backend_service_location = var.region
}
