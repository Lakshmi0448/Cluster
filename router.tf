resource "google_compute_router" "router" {
  name    = "router"
  region  = "asia-south1"
  network = google_compute_network.main.id
}