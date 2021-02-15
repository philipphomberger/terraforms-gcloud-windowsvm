resource "google_compute_target_instance" "default" {
  name     = "target"
  instance = google_compute_instance.target-vm.id
}

data "google_compute_image" "vmimage" {
  family  = "Windows Server 2019 Datacenter"
  project = "windows-cloud"
}

resource "google_compute_instance" "target-vm" {
  name         = "target-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = data.google_compute_image.vmimage.self_link
    }
  }

  network_interface {
    network = "default"
  }
}
