variable "region" {
  description = "The region where resources will be created"
  type        = string
}

variable "frontend_service_name" {
  description = "The name of the frontend Cloud Run service."
  type        = string
}

variable "backend_service_name" {
  description = "The name of the backend Cloud Run service."
  type        = string
}
variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "sara-sandbox-interns"
}