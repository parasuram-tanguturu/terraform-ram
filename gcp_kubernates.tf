resource "google_container_cluster" "googlekubernates" {
  name               = "googlekubicluster"
  location           = "asia-south1-a"
  initial_node_count = "1"
  node_locations = [
    "asia-south1-b"
  ]
  master_auth {
    password = "parasuramIloveYOu-16"
    username = "username"
  }
  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
    labels = {
      this-is-for = "dev-cluster"
    }
    tags = ["dev", "work"]
  }
}