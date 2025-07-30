output "frontend_url" {
  value = "http://storage.googleapis.com/${google_storage_bucket.frontend_bucket.name}/dist/index.html"
}