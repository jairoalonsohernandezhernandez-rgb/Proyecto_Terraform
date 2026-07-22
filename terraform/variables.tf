variable "gcp_project_id" {
  description = "El ID del proyecto de GCP"
  type        = string
}

variable "gcp_region" {
  description = "Región de despliegue de GCP"
  type        = string
  default     = "us-central1"
}

variable "bucket_name" {
  description = "Nombre del bucket inmutable para los logs"
  type        = string
}