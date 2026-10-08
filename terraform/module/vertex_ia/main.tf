resource "google_project_service" "vertex_ai_api" {
    project = var.project_id
    service = "aiplataform.googleapis.com"
    disable_on_destroy = false
}

resource "google_service_account" "vertex_sa" {
    project = var.project_id
    account_id = var.sa_name
    display_name = "Service Account para acceso a Vertex AI  desde la App"
}

resource "google_project_iam_member" "vertex_user_role" {
    project = var.project_id
    member = "serviceAccount:${google_service_account.vertex_sa.email}"
    role = "roles/apiplataform.user"
}