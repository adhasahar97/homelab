locals {
  list_of_releases = {
    "argocd" = {
      name       = "argocd"
      repository = "https://argoproj.github.io/argo-helm"
      chart      = "argo-cd"
      namespace  = "argocd"
      version    = "7.7.15"
      values     = {

      }
    },
    "cloudflare-tunnel" = {
      name       = "cloudflare-tunnel"
      repository = "https://helm.strrl.dev"
      chart      = "cloudflare-tunnel-ingress-controller"
      namespace  = "cloudflare-tunnel"
      version    = "0.0.16"
      values     = {
        "cloudflare_tunnel_token"      = var.cloudflare_api_token
        "cloudflare_tunnel_account_id" = var.cloudflare_tunnel_account_id
      }
    }
  }
}

resource "helm_release" "release" {
  for_each = local.list_of_releases

  name             = each.value.name
  repository       = each.value.repository
  chart            = each.value.chart
  version          = each.value.version
  namespace        = each.value.namespace
  create_namespace = true

  values = [templatefile("${path.module}/values/values-${each.value.name}.yaml", each.value.values)]
}