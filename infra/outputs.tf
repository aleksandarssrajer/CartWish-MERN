output "service_account_email" {
  value = module.bootstrap.service_account_email
}

output "workload_identity_provider" {
  value = module.bootstrap.workload_identity_provider
}

output "artifact_registry_repo" {
  value = module.bootstrap.artifact_registry_repo
}

output "backend_url" {
  value = module.backend.backend_url
}

output "frontend_bucket_name" {
  description = "Name of the GCS bucket used for hosting"
  value       = module.frontend.frontend_bucket_name
}

output "lb_ip_address"{
  description = "Global static IP address for the load balancer"
  value       = module.loadbalancer.lb_ip_address
}
# output "frontend_static_ip" {
#   description = "Global static IP address from frontend module"
#   value       = module.frontend.frontend_static_ip
# }

# output "frontend_bucket_url" {
#   description = "URL to the GCS bucket hosting the static site (not behind load balancer)"
#   value       = module.frontend.frontend_bucket_url
# }


# output "frontend_ssl_domains" {
#   description = "List of domains covered by the managed SSL certificate"
#   value       = module.frontend.frontend_ssl_domains
# }

# output "load_balancer_forwarding_rule_name" {
#   description = "Name of the HTTPS forwarding rule (entrypoint)"
#   value       = module.frontend.load_balancer_forwarding_rule_name
# }