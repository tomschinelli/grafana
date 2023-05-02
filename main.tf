
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