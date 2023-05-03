terraform {
  backend "s3" {
    bucket  = "tomschinelli-grafana-prod-terraform-state"
    encrypt = true
    key     = "terraform.tfstate"
    region  = "eu-central-1"
  }
}

resource "hcloud_ssh_key" "default" {
  name       = var.ssh_user
  public_key = file(var.ssh_default_public_key)
}
resource "hcloud_server" "grafana" {
  name        = "grafana"
  image       = var.os_type
  server_type = var.server_type
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.default.id]
}
data "cloudflare_zone" "grafana" {
  account_id = var.cloudflare_account_id
  name       = var.cloudflare_zone

}
resource "cloudflare_record" "grafana" {
  name    = var.domain_name
  value   = hcloud_server.grafana.ipv4_address
  type    = "A"
  zone_id = data.cloudflare_zone.grafana.id
}