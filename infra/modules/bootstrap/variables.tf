variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default = "sara-sandbox-interns"
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "europe-west1"
}


variable "github_repo" {
  description = "GitHub repo in org/repo format"
  type        = string
  default     = "aleksandarssrajer/CartWish-MERN"
}

variable "repo_name" {
  description = "Artifact Registry repository name"
  type        = string
  default     = "cartwish-repo"
}

variable "backend_bucket_name" {
  description = "Bucket with tf state"
  type = string
  default = "cartwish-terraform-state"
}

