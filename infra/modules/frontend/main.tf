resource "google_cloud_run_service" "frontend" {
  name     = "cartwish-frontend"
  location = "europe-west1"

  template {
    spec {
      containers {
        image = "europe-west1-docker.pkg.dev/sara-sandbox-interns/cartwish-repo/frontend:${var.frontend_image_tag}"

        ports {
          container_port = 80
        }
      }
    }
  }
}

resource "google_cloud_run_service_iam_member" "frontend_public" {
  location = google_cloud_run_service.frontend.location
  service  = google_cloud_run_service.frontend.name
  role     = "roles/run.invoker"
  member   = "allUsers"

  depends_on = [google_cloud_run_service.frontend]
}