output "frontend_static_ip" {
  description = "Global static IP address for the frontend load balancer"
  value       = google_compute_global_address.frontend_ip.address
}

output "frontend_bucket_url" {
  description = "URL to the GCS bucket hosting the static site (not behind load balancer)"
  value       = "https://storage.googleapis.com/${google_storage_bucket.frontend_bucket.name}/index.html"
}

output "frontend_bucket_name" {
  description = "Name of the GCS bucket used for hosting"
  value       = google_storage_bucket.frontend_bucket.name
}

output "frontend_ssl_domains" {
  description = "List of domains covered by the managed SSL certificate"
  value       = google_compute_managed_ssl_certificate.frontend_ssl_cert.managed[0].domains
}

output "load_balancer_forwarding_rule_name" {
  description = "Name of the HTTPS forwarding rule (entrypoint)"
  value       = google_compute_global_forwarding_rule.frontend_forwarding_rule.name
}