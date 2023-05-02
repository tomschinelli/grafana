//variable "hcloud_token" {
//  sensitive = true
//}
variable "location" {
  default = "nbg1"
}
variable "os_type" {
  default = "ubuntu-20.04"
}
variable "server_type" {
  default = "cx11"
}
variable "disk_size" {
  default = "20"
}