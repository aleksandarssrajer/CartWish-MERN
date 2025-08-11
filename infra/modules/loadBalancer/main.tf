resource "google_compute_address" "cartwish_lb" {
  name = "cartwish-lb-ip"
  region ="${var.region}"
}

resource "google_compute_region_network_endpoint_group" "frontend_neg" {
  name                  = "cartwish-frontend-neg"
  region                = var.region
  network_endpoint_type = "SERVERLESS"

  cloud_run {
    service = var.frontend_service_name 
  }
  
}
resource "google_compute_region_network_endpoint_group" "backend_neg" {
    name                  = "cartwish-backend-neg"
    region                = var.region
    network_endpoint_type = "SERVERLESS"
    
    cloud_run {
        service = var.backend_service_name 
    }
}

resource "google_compute_region_backend_service" "frontend_backend_service" {
    name = "cartwish-lb-frontend-bes"
    region      = var.region
    protocol              = "HTTP"
    load_balancing_scheme = "EXTERNAL_MANAGED"

    backend {
      group = google_compute_region_network_endpoint_group.frontend_neg.id
      capacity_scaler = 1.0
    }
}

resource "google_compute_region_backend_service" "backend_backend_service" {
    project = var.project_id
    name = "cartwish-lb-backend-bes"
    region      = var.region
    protocol              = "HTTP"
    load_balancing_scheme = "EXTERNAL_MANAGED"

    backend {
      group = google_compute_region_network_endpoint_group.backend_neg.id
      capacity_scaler = 1.0
    }
}


resource "google_compute_region_url_map" "cartwish_lb_url_map" {
    name            = "cartwish-lb-url-map"
    region          = var.region
    default_service = google_compute_region_backend_service.frontend_backend_service.id

    host_rule {
      hosts = ["*"]
      path_matcher = "allpaths"
    }

    path_matcher {
      name            = "allpaths"
      default_service = google_compute_region_backend_service.frontend_backend_service.id

      path_rule {
        paths   = ["/api/*"]
        service = google_compute_region_backend_service.backend_backend_service.id
      }
    }  
}

resource "google_compute_region_target_http_proxy" "cartwish_lb_http_proxy" {
  name    = "cartwish-lb-http-proxy"
  region  = var.region
  url_map = google_compute_region_url_map.cartwish_lb_url_map.id
}

resource "google_compute_forwarding_rule" "lb_forwarding_rule" {
  name        = "cartwish-lb-forwarding-rule"
  region      = var.region
  ip_protocol = "TCP"
  port_range  = "80" # Sluša na HTTP portu 80
  ip_address  = google_compute_address.cartwish_lb.address
  target      = google_compute_region_target_http_proxy.cartwish_lb_http_proxy.id
  load_balancing_scheme = "EXTERNAL_MANAGED"
}