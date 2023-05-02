resource "hcloud_ssh_key" "default" {
  name       = "tomschinelli"
  public_key = file("~/.ssh/id_rsa.pub")
}
resource "hcloud_server" "grafana" {
  # ...
  name        = "grafana"
  image       = var.os_type
  server_type = var.server_type
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.default.id]
}
data "cloudflare_zone" "grafana" {
  account_id = "657a56c8bdb8f013919004e139c98591"
  name       = "tomschinelli.io"

}
resource "cloudflare_record" "grafana" {
  name    = "grafana.tomschinelli.io"
  value   = hcloud_server.grafana.ipv4_address
  type    = "A"
  zone_id = data.cloudflare_zone.grafana.id
}