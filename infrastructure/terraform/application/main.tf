terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
    }
  }
}

module "helm" {
  source                       = "../modules/helm"
  cloudflare_api_token         = var.cloudflare_api_token
  cloudflare_tunnel_account_id = var.cloudflare_account_id
  cloudflare_tunnel_name       = var.cloudflare_tunnel_name
  github_token                 = var.github_token
  github_username              = var.github_username
}

module "cloudflare" {
  source                 = "../modules/cloudflare"
  cloudflare_email       = var.cloudflare_email
  cloudflare_tunnel_name = var.cloudflare_tunnel_name
}