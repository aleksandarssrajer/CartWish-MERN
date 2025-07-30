# resource "google_cloud_run_service" "frontend" {
#   name     = "cartwish-frontend"
#   location = "europe-west1"

#   template {
#     spec {
#       containers {
#         image = "europe-west1-docker.pkg.dev/sara-sandbox-interns/cartwish-repo/frontend:${var.frontend_image_tag}"

#         ports {
#           container_port = 80
#         }
#       }
#     }
#   }
# }

# resource "google_cloud_run_service_iam_member" "frontend_public" {
#   location = google_cloud_run_service.frontend.location
#   service  = google_cloud_run_service.frontend.name
#   role     = "roles/run.invoker"
#   member   = "allUsers"

#   depends_on = [google_cloud_run_service.frontend]
# }

resource "google_storage_bucket" "frontend_bucket" {
  name = "cartwish-frontend-bucket-${var.project_id}"
  project = var.project_id
  location = var.region
  force_destroy = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "index.html"
  }

   cors {
    origin          = ["*"]
    method          = ["GET", "POST", "PUT", "DELET", "PATCH", "HEAD"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}
resource "google_storage_bucket_iam_member" "public_access" {
  bucket = google_storage_bucket.frontend_bucket.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"

  depends_on = [google_storage_bucket.frontend_bucket]
  
}