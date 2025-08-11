output "frontend_url" {
  value = google_cloud_run_service.frontend.status[0].url
}
output "frontend_service_name" {
  value = google_cloud_run_service.frontend.name // ili .backend.name
}