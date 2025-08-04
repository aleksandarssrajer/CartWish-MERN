# Izlazna vrednost sa IP adresom LB-a, da znaš gde da usmeriš DNS.
output "lb_ip_address" {
  description = "The IP address of the load balancer."
  value       = google_compute_global_address.default.address
}