provider "google" {
  credentials = "${file("hitmebaby.json")}"
  project     = "prontotools-212000"
  region      = "asia-southeast1"
  zone        = "asia-southeast1-b"
}


