//variable "hcloud_token" {
//  sensitive = true
//}
variable "ssh_default_public_key" {
  type        = string
  description = "public key location"
  default     = "~/.ssh/id_rsa.pub"
}
variable "ssh_user" {
  type        = string
  description = "ssh user name"
  default     = "ubuntu"
}
variable "cloudflare_account_id" {
  type        = string
  description = "Cloudflare account id"
}
variable "cloudflare_zone" {
  type        = string
  description = "Cloudflare zone"
}
variable "domain_name" {
  type        = string
  description = "Domain of the instance"

}
variable "location" {
  description = "Datacenter region of the server"
  default     = "nbg1"
}
variable "os_type" {
  description = "OS for the grafana servrer"
  default     = "ubuntu-20.04"
}
variable "server_type" {
  description = "Server instance type"
  default     = "cx11"
}
variable "disk_size" {
  description = "Server storage size in GB"
  default     = "20"
}