terraform {
  backend "s3" {
    bucket = "adha-homelab-iac-terraform-state"
    key    = "terraform/homelab"
    region = "ap-southeast-1"
  }
}