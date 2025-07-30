resource "google_compute_global_address" "frontend_ip" {
    name = "frontend-static-ip"
}

resource "google_compute_managed_ssl_certificate" "frontend_ssl_cert" {
    name = "frontend-ssl-cert"
    managed {
        domains = [var.domain_name]  # Replace with your domain
    }
}

resource "google_compute_backend_bucket" "frontend_backend_bucket" {
  name        = "frontend-backend-bucket"
  bucket_name = google_storage_bucket.frontend_bucket.name
  enable_cdn  = false
}

resource "google_compute_url_map" "frontend_url_map" {
  name            = "frontend-url-map"
  default_service = google_compute_backend_bucket.frontend_backend_bucket.id

  depends_on = [google_compute_backend_bucket.frontend_backend_bucket]
}


resource "google_compute_target_https_proxy" "frontend_https_proxy" {
  name             = "frontend-https-proxy"
  url_map          = google_compute_url_map.frontend_url_map.id
  ssl_certificates = [google_compute_managed_ssl_certificate.frontend_ssl_cert.id]
}

resource "google_compute_global_forwarding_rule" "frontend_forwarding_rule" {
  name        = "frontend-https-forwarding-rule"
  ip_address  = google_compute_global_address.frontend_ip.id
  ip_protocol = "TCP"
  port_range  = "443"
  target      = google_compute_target_https_proxy.frontend_https_proxy.id
}