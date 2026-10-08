resource "google_compute_global_address" "default" {
    name = "${var.name_prefix}-pip"
    project = var.project_id
}

resource "google_compute_health_check" "health" {
    name = "${var.name_prefix}-hc"
    project = var.project_id

    http_health_check {
        port = 80
        request_path = "/health"
    }
}

resource "google_compute_backend_service" "default" {
    name = "${var.name_prefix}-bs"
    project = var.project_id
    protocol = "HTTP"
    port_name = "http"
    load_balancing_scheme = "EXTERNAL_MANAGED"
    health_checks = [google_compute_health_check.default.id]
    security_policy = var.security_policy_id
}

resource "google_compute_url_map" "default" {
    name = "${var.name_prefix}-url-map"
    project = var.project_id
    default_service = google_compute_backend_service.default.id
}

resource "google_compute_target_http_proxy" "default" {
    name = "${var.name_prefix}-http-proxy"
    project = var.project_id
    url_map = google_compute_backend_service.default.id
}

resource "google_compute_forwarding_rule" "default" {
    name = "${var.name_prefix}-fr"
    project = var.project_id
    ip_protocol = "TCP"
    port_range = "80"
    target = google_compute_target_http_proxy.default.id
    ip_address = google_compute_global_address.default.id
    load_balancing_scheme = "EXTERNAL_MANAGED"
}