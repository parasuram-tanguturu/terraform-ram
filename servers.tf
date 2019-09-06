resource "google_compute_instance" "firstserver" {
  machine_type = "f1-micro"
  name = "terraform-firstserver"
  zone = "asia-south1-a"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    subnetwork = "${google_compute_subnetwork.dev-subnet.name}"
    access_config {}
  }
  metadata={
    foo= "bar"
  }
  service_account {
    scopes = ["userinfo-email","compute-ro","storage-ro"]
  }
}