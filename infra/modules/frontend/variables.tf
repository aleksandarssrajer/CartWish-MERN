variable "frontend_image_tag" {
  description = "Docker image tag for frontend"
  type        = string
  default     = "latest" # ili "" ako hoćeš da bude required ručno
}

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
}

variable "backend_url" {
  description = "Backend API URL"
  type        = string
}

variable "domain_name" {
  description = "Public domain for frontend (e.g. www.example.com)"
  type        = string
  default = "cartwish.gcp.com"
}