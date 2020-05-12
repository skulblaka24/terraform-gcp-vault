# Configure the Google Cloud provider
provider "google" {
  region  = var.region
  project = var.project_name
}

resource "google_compute_address" "vault-ip-addresses" {
  name  = "vault-ip-${count.index}"
  count = var.node_count
}

# Google Cloud Engine instance creation
# https://cloud.google.com/compute/docs/machine-types
# https://cloud.google.com/compute/docs/regions-zones
resource "google_compute_instance" "vault" {
  name                      = "prod-vault-${count.index}"
  machine_type              = var.instance_type
  zone                      = var.region_zone
  allow_stopping_for_update = true

  tags = ["vault"]

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = "default"

    access_config {
      # Static IP
      nat_ip = element(
        google_compute_address.vault-ip-addresses.*.address,
        count.index,
      )
    }
  }

  metadata = {
    sshKeys   = "${var.ssh_user}:${var.ssh_pub_key}"
    # startup_script for debian
    startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python dnsutils libcap2-bin"
  }

  # Label used by Vault GCP Auth GCE role to allow Instance Authentication.
  labels = {
    auth = "yes"
  }

  count = var.node_count
}
























