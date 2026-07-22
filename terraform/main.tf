resource "google_storage_bucket" "log_bucket" {
    name = var.bucket_name
    location = var.gcp_region
    force_destroy = true

    uniform_bucket_level_access = true

    retention_policy {
        is_locked = false
        retention_period = 86400
    }
}


resource "google_artifact_registry_repository" "docker_repo" {
     location = var.gcp_region
     repository_id = "cloud-log-archiver-repo"
     description = "Repositorio de imágenes Docker para procesamiento de logs"
     format = "DOCKER"
}