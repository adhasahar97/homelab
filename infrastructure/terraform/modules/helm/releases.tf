locals {
  list_of_releases = {
    "argocd" = {
      name       = "argocd"
      repository = "https://argoproj.github.io/argo-helm"
      chart      = "argo-cd"
      namespace  = "argocd"
      version    = "7.7.15"
      values_path = "${path.module}/values/values-argocd.yaml"
      yaml_values = {
        
      }
    },
    "cloudflare-tunnel" = {
      name       = "cloudflare-tunnel-ingress-controller"
      repository = "https://helm.strrl.dev"
      chart      = "cloudflare-tunnel-ingress-controller"
      namespace  = "cloudflare-tunnel"
      version    = "0.0.16"
      values_path = "${path.module}/values/values-cloudflare-tunnel.yaml"
      yaml_values = {
        "cloudflare.apiToken"   = var.cloudflare_api_token
        "cloudflare.accountId"  = var.cloudflare_tunnel_account_id
        "cloudflare.tunnelName" = var.cloudflare_tunnel_name
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

  values = [templatefile(each.value.values_path, each.value.yaml_values)]
}