output "public_ip" {
    description = "IP pública asignada a Load Balancer"
    value = google_compute_global_address.default.address
}

output "backend_service_id" {
    description = "Id del servicio backend para Load Balancer"
    value = google_compute_backend_service.default.id
}