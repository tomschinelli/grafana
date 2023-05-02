terraform {
  backend "s3" {
    bucket = "tomschinelli-grafana-tf-state"
    key    = "terraform.tfstate"
    region = "eu-central-1"
  }
}