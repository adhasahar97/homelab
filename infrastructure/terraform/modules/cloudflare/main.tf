terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

data "cloudflare_accounts" "account" {
  name = var.cloudflare_email
}

resource "random_password" "tunnel_secret" {
  length = 64
}

resource "cloudflare_zero_trust_tunnel_cloudflared" "k8s-tunnel" {
  account_id = "5b2f562a73bc2d4816ec68f4b653e38d"
  name       = var.cloudflare_tunnel_name
  secret     = base64sha256(random_password.tunnel_secret.result)
}