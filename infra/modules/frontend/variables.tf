variable "frontend_image_tag" {
  description = "Docker image tag for frontend"
  type        = string
  default     = "latest" # ili "" ako hoćeš da bude required ručno
}