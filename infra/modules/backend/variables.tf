variable "backend_image_tag" {
  description = "Docker image tag for backend"
  type        = string
  default     = "latest"
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