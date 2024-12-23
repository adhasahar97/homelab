terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
    }
  }
}

module "helm" {
  source = "../modules/helm"
  cloudflare_tunnel_token = module.cloudflare.cloudflare_tunnel_token
}

module "cloudflare" {
  source = "../modules/cloudflare"
  cloudflare_email = var.cloudflare_email
}