variable "project_id" {
  description = "The GCP project ID"
  type        = string
}


variable "frontend_bucket_name" {
  description = "The name of the GCS bucket for the frontend"
  type        = string
}

variable "backend_service_name" {
  description = "The name of the Cloud Run backend service"
  type        = string
}

variable "backend_service_location" {
  description = "The location of the Cloud Run backend service"
  type        = string
}