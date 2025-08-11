
//Prazan kontejner koji ce cuvati nasu tajnu
resource "google_secret_manager_secret" "database_url" {
  secret_id = "databse_url"
  replication {
    auto {
      
    }
  }
}

resource "google_secret_manager_secret_version" "database_url_version"  {
  secret = google_secret_manager_secret.database_url.id
  secret_data = var.database_url_secret
}

resource "google_secret_manager_secret" "jwt_secret" {
  secret_id = "jwt-secret"
  replication {
    auto {
      
    }
  }
}

resource "google_secret_manager_secret_version" "jwt_secret_version" {
  secret      = google_secret_manager_secret.jwt_secret.id
  secret_data = var.jwt_secret_value
}
