resource "google_compute_network" "vpc_network" {
  name                    = "my-app-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "my-app-subnet"
  network       = google_compute_network.vpc_network.id
  ip_cidr_range = "10.0.1.0/24"
  region        = var.region
}

resource "google_compute_firewall" "allow_http_https" {
  name    = "allow-http-https"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_address" "vm_static_ip" {
  name   = "my-app-vm-static-ip"
  region = var.region
}

resource "google_compute_instance" "vm_instance" {
  name         = "my-app-web-vm"
  machine_type = "e2-medium"
  zone         = "${var.region}-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.subnet.id

    access_config {
      nat_ip = google_compute_address.vm_static_ip.address
    }
  }

  metadata = {
    ssh-keys  = "karen:${file("~/.ssh/id_rsa.pub")}"
    app_name  = "my-app"
    environment = "production"
    role      = "frontend"
  }
}
