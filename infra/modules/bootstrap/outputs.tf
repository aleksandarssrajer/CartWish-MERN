
output "service_account_email" {
  value = google_service_account.github_actions.email
}

output "workload_identity_provider" {
  value = google_iam_workload_identity_pool_provider.github_provider.name
}

output "artifact_registry_repo" {
  value = google_artifact_registry_repository.docker_repo.repository_id
}