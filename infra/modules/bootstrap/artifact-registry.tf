resource "google_artifact_registry_repository" "docker_repo" {
  format        = "DOCKER"
  location      = var.region
  repository_id = var.repo_name
}