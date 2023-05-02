# needed for terraform >= 0.13
terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.25.2"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}
data "aws_secretsmanager_secret_version" "hcloud_secret" {
  secret_id = "hcloud"
}

locals {
  hcloud_secret = jsondecode(
    data.aws_secretsmanager_secret_version.hcloud_secret.secret_string
  )
}
# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token = local.hcloud_secret.token
}