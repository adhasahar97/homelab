terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

provider "cloudflare" {
    
}

data "cloudflare_accounts" "account" {
  name = var.cloudflare_email
}

resource "random_password" "tunnel_secret" {
  length = 64
}

resource "cloudflare_tunnel" "k8s-tunnel" {
  account_id = "5b2f562a73bc2d4816ec68f4b653e38d"
  name       = "homelab-k8s-tunnel"
  secret     = base64sha256(random_password.tunnel_secret.result)
}