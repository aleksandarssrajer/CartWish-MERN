# 1. Rezervišemo globalnu statičku IP adresu za naš Load Balancer
resource "google_compute_global_address" "default" {
  project = var.project_id
  name    = "cartwish-lb-static-ip"
}


resource "google_compute_backend_bucket" "frontend" {
    project = var.project_id
    name    = "cartwish-frontend-backend-bucket"
    bucket_name = var.frontend_bucket_name
    enable_cdn = true
}

resource "google_compute_region_network_endpoint_group" "backend_neg" {
  project               = var.project_id
  name                  = "cartwish-backend-neg-http"
  network_endpoint_type = "SERVERLESS"
  region                = var.backend_service_location
  cloud_run {
    service = var.backend_service_name
  }
}

resource "google_compute_backend_service" "backend" {
  project             = var.project_id
  name                = "cartwish-backend-service-http"
  protocol            = "HTTP"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  backend {
    group = google_compute_region_network_endpoint_group.backend_neg.id
  }
}

resource "google_compute_url_map" "default" {
  project         = var.project_id
  name            = "cartwish-url-map-http"
  default_service = google_compute_backend_bucket.frontend.id

  # Ovde ne definišemo host_rule jer nemamo domen.
  # Pravila će se primenjivati na sve zahteve koji stignu na IP adresu LB-a.
  host_rule {
    hosts        = ["*"]
    path_matcher = "api-paths" # Kažemo: "Za ove hostove, koristi sledeći set pravila po putanjama"
  }
  path_matcher {
    name            = "api-paths"
    default_service = google_compute_backend_bucket.frontend.id
    path_rule {
      paths   = ["/api", "/api/*", "/static", "/static/*"]
      service = google_compute_backend_service.backend.id
    }
  }
}


# 6. Target HTTPS Proxy: On koristi URL mapu i SSL sertifikat.
resource "google_compute_target_http_proxy" "default" {
  project = var.project_id
  name    = "cartwish-http-proxy"
  url_map = google_compute_url_map.default.id
}


# 7. Global Forwarding Rule: Povezuje javnu IP adresu (na portu 443) sa proxy-jem.
# Ovo je ulazna tačka za sav saobraćaj.
resource "google_compute_global_forwarding_rule" "default" {
  project     = var.project_id
  name        = "cartwish-forwarding-rule-http"
  ip_protocol = "TCP"
  port_range  = "80" # <-- HTTP port
  target      = google_compute_target_http_proxy.default.id # <-- Povezan na HTTP proxy
  ip_address  = google_compute_global_address.default.address
}

