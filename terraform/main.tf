provider "google" {
  credentials = "${file("hitmebaby.json")}"
  project     = "prontotools-212000"
  region      = "asia-south1"
  zone        = "asia-south1-c"
}

resource "google_compute_instance" "tf_instance" {
  name         = "tf-instance-${count.index}"
  machine_type = "n1-standard-2"
  count        = 1

  boot_disk {
    initialize_params {
      image = "ubuntu-1804-bionic-v20190530"
      size  = 30
    }
  }

  metadata = {
    sshKeys = "circleci:${file("circleci.pub")}"
  }

  network_interface {
    network       = "default"
    access_config {}
  }

  tags = ["my-web", "http-server", "https-server"]
}

output "ip" {
  value = "${google_compute_instance.tf_instance.*.network_interface.0.access_config.0.nat_ip}"
}
