terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
    }
  }
}

module "helm" {
  source = "../modules/helm"
}

module "cloudflare" {
  source = "../modules/cloudflare"

  cloudflare_email = var.cloudflare_email
  
}