terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
    }
  }
}

module "helm" {
  source                       = "../modules/helm"
  cloudflare_tunnel_token      = module.cloudflare.cloudflare_tunnel_token
  cloudflare_tunnel_account_id = module.cloudflare.cloudflare_tunnel_account_id
  cloudflare_tunnel_name       = var.cloudflare_tunnel_name
}

module "cloudflare" {
  source                 = "../modules/cloudflare"
  cloudflare_email       = var.cloudflare_email
  cloudflare_tunnel_name = var.cloudflare_tunnel_name
}