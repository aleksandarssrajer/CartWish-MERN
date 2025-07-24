# variable "project_id" {
#   description = "GCP project ID"
#   type        = string
# }

# variable "region" {
#   description = "GCP region"
#   type        = string
#   default     = "europe-west1"
# }

# variable "repo_name" {
#   description = "Artifact Registry repo name"
#   type        = string
#   default     = "cartwish-repo"
# }

variable "backend_image_tag" {
  description = "Docker image tag for backend"
  type        = string
  default     = "latest"
}

variable "frontend_image_tag" {
  description = "Docker image tag for frontend"
  type        = string
  default     = "latest"
}