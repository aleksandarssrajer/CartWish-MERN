variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "sara-sandbox-interns"
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "europe-west1"
}

variable "bucket_name" {
  description = "Name of the Terraform state bucket"
  type        = string
  default     = "cartwish-terraform-state"
}

variable "github_repo" {
  description = "GitHub repository in org/repo format"
  type        = string
  default     = "aleksandarssrajer/CartWish-MERN"
}

variable "repo_name" {
  description = "Artifact Registry repository name"
  type        = string
  default     = "cartwish-repo"
}

variable "backend_image_tag" {
  description = "Docker image tag for backend"
  type        = string
  default = "latest"

}

variable "frontend_image_tag" {
  description = "Docker image tag for frontend"
  type        = string
  default = "latest"
}

variable "database_url_secret" {
  description = "The connection string for the MongoDB database"
  type        = string
  sensitive = true
}

variable "jwt_secret_value" {
  description = "The secret key for JWT signing"
  type = string
  sensitive = true
}
