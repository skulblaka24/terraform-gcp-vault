variable "region" {
  description = "GCP region targeted"
  default     = "europe-west1"
}

variable "region_zone" {
  description = "GCP zone targeted"
  default     = "europe-west1-c"
}

variable "project_name" {
  description = "GCP project targeted"
}

variable "GOOGLE_CREDENTIALS" {
  description = "GCP access creds"
}

variable "image" {
  description = "GCP Image to use"
  default     = "debian-9"
}

variable "instance_type" {
  description = "GCP Machine Type to use"
  default     = "n1-standard-1"
}

variable "ssh_user" {
  description = "instance SSH user"
  default     = "gauthier_donikian"
}

variable "ssh_pub_key" {
  description = "SSH public key to authorize"
}

variable "node_count" {
  description = "variable to set the wanted number of host"
}

#### DNS

# Google Cloud DNS Zone
variable "gcp_dns_zone" {
  description = "Google Cloud zone name to create"
}

# Google Cloud DNS Domain
variable "gcp_dns_domain" {
  description = "DNS Domain where to add entry"
}

# DNS TTL
variable "ttl" {
  description = "DNS ttl of entry"
  default     = "300"
}

#### Google Firewalling

variable "external_source_ranges" {
  type        = list(string)
  description = "Source range to allow inbound traffic to Consul API"
  default     = ["0.0.0.0/0"]
}

