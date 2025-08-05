variable "frontend_image_tag" {
  description = "Docker image tag for frontend"
  type        = string
  default     = "latest" # ili "" ako hoćeš da bude required ručno
}

variable "backend_api_url" {
  description = "The URL for the backend API."
  type        = string
}