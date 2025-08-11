resource "google_cloud_run_service" "backend" {
  name     = "cartwish-backend"
  location = "europe-west1"

  template {
    spec {
      service_account_name = google_service_account.run_sa.email
      containers {
        image = "europe-west1-docker.pkg.dev/sara-sandbox-interns/cartwish-repo/backend:${var.backend_image_tag}"

        env {
          name  = "DATABASE"
          # value = "mongodb+srv://aleksandarsrajer:aleksandarsrajer@cartwishcluster.jtpr4rz.mongodb.net/?retryWrites=true&w=majority&appName=CartWishCluster"
          value_from {
            secret_key_ref {
              name = google_secret_manager_secret.database_url.secret_id
              key  = "latest" # Uvek koristi najnoviju verziju tajne
            }
          }
        }

        env {
          name  = "JWTSECRET"
          # value = "cartwish_secret"
          value_from {
            secret_key_ref {
              name = google_secret_manager_secret.jwt_secret.secret_id
              key  = "latest"
            }
          }
        }

        ports {
          container_port = 5000
        }
      }
    }
  }
}

resource "google_service_account" "run_sa" {
  account_id   = "cartwish-backend-run-sa"
  display_name = "Service Account for CartWish Backend"
}


resource "google_secret_manager_secret_iam_member" "database_url_accessor" {
  project   = google_secret_manager_secret.database_url.project
  secret_id = google_secret_manager_secret.database_url.secret_id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${google_service_account.run_sa.email}"
}

resource "google_secret_manager_secret_iam_member" "jwt_secret_accessor" {
  project   = google_secret_manager_secret.jwt_secret.project
  secret_id = google_secret_manager_secret.jwt_secret.secret_id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${google_service_account.run_sa.email}"
}