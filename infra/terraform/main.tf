# resource "google_service_account" "nodepool_sa" {
#   account_id   = "service-account-id"
#   display_name = "Service Account"
# }

resource "google_container_cluster" "gkecluster" {
  name     = "dev-cluster"
  location = "europe-west3-a"
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "dev-cluster-generalnp"
  location   = "europe-west3-a"
  cluster    = google_container_cluster.gkecluster.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"
    # service_account = google_service_account.nodepool_sa.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
