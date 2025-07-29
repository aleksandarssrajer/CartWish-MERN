resource "google_service_account" "github_actions" {
  account_id   = "github-actions-deployer"
  display_name = "GitHub Actions Deployer"
}

resource "google_project_iam_member" "github_deploy_permissions" {
  for_each = toset([
    "roles/run.admin",
    "roles/storage.admin",
    "roles/artifactregistry.writer",
    "roles/iam.serviceAccountUser",
    "roles/viewer",
    "roles/iam.workloadIdentityPoolAdmin",
    "roles/iam.serviceAccountTokenCreator"
  ])

  role    = each.key
  project = var.project_id
  member  = "serviceAccount:${google_service_account.github_actions.email}"
}

# resource "google_project_iam_member" "github_actions_cloud_run" {
#   role    = "roles/run.admin"
#   member  = "serviceAccount:${google_service_account.github_actions.email}"
#   project = var.project_id
# }

# resource "google_project_iam_member" "github_actions_artifact" {
#   role    = "roles/artifactregistry.writer"
#   member  = "serviceAccount:${google_service_account.github_actions.email}"
#   project = var.project_id
# }

# resource "google_project_iam_member" "github_actions_viewer" {
#   role    = "roles/viewer"
#   member  = "serviceAccount:${google_service_account.github_actions.email}"
#   project = var.project_id
# }

# resource "google_project_iam_member" "github_actions_workload_identity_admin" {
#   role    = "roles/iam.workloadIdentityPoolAdmin"
#   member  = "serviceAccount:${google_service_account.github_actions.email}"
#   project = var.project_id
# }

# resource "google_project_iam_member" "github_actions_token" {
#   role    = "roles/iam.serviceAccountTokenCreator"
#   member  = "serviceAccount:${google_service_account.github_actions.email}"
#   project = var.project_id
# }

# resource "google_project_iam_member" "github_actions_sa" {
#   role    = "roles/iam.serviceAccountUser"
#   member  = "serviceAccount:${google_service_account.github_actions.email}"
#   project = var.project_id
# }

# resource "google_storage_bucket_iam_member" "github_actions_storage" {
#   bucket = "cartwish-terraform-state"
#   role   = "roles/storage.objectAdmin"
#   member = "serviceAccount:${google_service_account.github_actions.email}"

# }