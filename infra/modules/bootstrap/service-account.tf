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
    "roles/iam.serviceAccountTokenCreator",
    "roles/resourcemanager.projectIamAdmin",
    "roles/iam.serviceAccountAdmin",
    "roles/firebasehosting.admin",
  ])

  role    = each.key
  project = var.project_id
  member  = "serviceAccount:${google_service_account.github_actions.email}"
}

