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
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}
data "aws_secretsmanager_secret_version" "hcloud" {
  secret_id = "hcloud"
}

data "aws_secretsmanager_secret_version" "cloudflare" {
  secret_id = "cloudflare"
}

locals {
  hcloud = jsondecode(
    data.aws_secretsmanager_secret_version.hcloud.secret_string
  )
  cloudflare = jsondecode(
    data.aws_secretsmanager_secret_version.cloudflare.secret_string
  )
}
# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token = local.hcloud.token
}

provider "cloudflare" {
  api_token = local.cloudflare.token
}