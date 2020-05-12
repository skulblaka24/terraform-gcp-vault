resource "google_compute_firewall" "allow-inbound-vault-api" {
  name    = "allow-inbound-vault-api"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["8200"]
  }

  target_tags = ["vault"]
}

# To allow hybrid environnement and connect outside cluster to this one.
#resource "google_compute_firewall" "allow-inbound-vault-api" {
#  name    = "allow-inbound-vault-api"
#  network = "default"

#  allow {
#    protocol = "tcp"
#    ports    = ["8201"]
#  }

#  target_tags = ["vault"]
#}

resource "google_compute_firewall" "allow-inbound-nginx" {
  name    = "allow-inbound-nginx"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  target_tags = ["vault"]
}

resource "google_compute_firewall" "allow-vault-2-vault" {
  name        = "allow-vault-2-vault"
  description = "allow internal vault traffic"
  network     = "default"

  allow {
    protocol = "tcp"
    ports    = ["8201"]
  }

  source_tags = ["vault"]
  target_tags = ["vault"]
}

