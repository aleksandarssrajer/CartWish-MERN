output "backend_url" {
  value = google_cloud_run_service.backend.status[0].url
}

output "backend_service_name" {
  description = "The name of the Cloud Run service"
  value       = google_cloud_run_service.backend.name
}