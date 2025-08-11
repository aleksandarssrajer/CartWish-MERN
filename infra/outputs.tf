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
output "frontend_url" {
  value = module.frontend.frontend_url
}

output "load_balancer_ip" {
  description = "Public IP address of the application Load Balancer."
  value       = module.loadbalancer.load_balancer_ip
}