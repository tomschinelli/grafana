

output "web_servers_status" {
  value = hcloud_server.grafana.status

}

output "web_servers_ips" {
  value = hcloud_server.grafana.ipv4_address
}