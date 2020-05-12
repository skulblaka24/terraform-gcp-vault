# Print out the vault node IPs.
output "gcp_instances_vault_ip" {
  value = google_compute_instance.vault.*.network_interface.0.access_config.0.nat_ip
}

output "gcp_dns_zone_nameservers" {
  value = google_dns_managed_zone.dns_zone.*.name_servers
}