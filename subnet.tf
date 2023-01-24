resource "google_compute_subnetwork" "subnet1" {
  name                     = "subnet1"
  ip_cidr_range            = "10.0.0.0/18"
  region                   = "asia-south1"
  network                  = google_compute_network.main.id

  secondary_ip_range {
    range_name    = "k8s-pods"
    ip_cidr_range = "10.48.0.0/14"
  }
  secondary_ip_range {
    range_name    = "k8s-services"
    ip_cidr_range = "10.52.0.0/20"
  }
}