resource "google_service_account" "cluster-service-account" {
  account_id = "cluster-service-account"
}

resource "google_project_iam_member" "cluster-service-account" {
  project = "kubernetes-project-375706"
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.cluster-service-account.email}"
}

resource "google_service_account_iam_member" "cluster-service-account" {
  service_account_id = google_service_account.cluster-service-account.id
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:kubernetes-project-375706.svc.id.goog[kubernetes-project-375706]"
}