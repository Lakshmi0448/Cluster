resource "google_compute_subnetwork" "subnet1" {
  name                     = var.subnetwork_name
  ip_cidr_range            = "10.0.0.0/18"
  region                   = var.region
  network                  = google_compute_network.main.id
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = "k8s-pods"
    ip_cidr_range = "10.48.0.0/14"
  }
  secondary_ip_range {
    range_name    = "k8s-services"
    ip_cidr_range = "10.52.0.0/20"
  }
  log_config {   
    aggregation_interval = "INTERVAL_10_MIN"    
    flow_sampling        = 0.5    
    metadata             = "INCLUDE_ALL_METADATA"
  }
}
