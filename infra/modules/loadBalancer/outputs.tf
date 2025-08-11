output "load_balancer_ip" {
  description = "The public IP address of the Load Balancer."
  value       = google_compute_address.cartwish_lb.address # <-- ISPRAVLJENO IME
}