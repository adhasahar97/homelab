locals {
  list_of_releases = {
    "argocd" = {
      name       = "argocd"
      repository = "https://argoproj.github.io/argo-helm"
      chart      = "argo-cd"
      namespace  = "argocd"
      version    = "8.0.12"
      values     = {
        "hostname" = var.cloudflare_domain
      }
    },
    # "argo-workflows" = {
    #   name       = "argo-workflows"
    #   repository = "https://argoproj.github.io/argo-helm"
    #   chart      = "argo-workflows"
    #   namespace  = "argo-workflows"
    #   version    = "0.45.15"
    #   values     = {
    #     "hostname" = var.cloudflare_domain
    #   }
    # },
    # "cloudflare-tunnel" = {
    #   name       = "cloudflare-tunnel"
    #   repository = "https://helm.strrl.dev"
    #   chart      = "cloudflare-tunnel-ingress-controller"
    #   namespace  = "cloudflare-tunnel"
    #   version    = "0.0.18"
    #   values     = {
    #     "cloudflare_tunnel_token"      = var.cloudflare_api_token
    #     "cloudflare_tunnel_account_id" = var.cloudflare_tunnel_account_id
    #     "cloudflare_tunnel_name"       = var.cloudflare_tunnel_name
    #     "cloudflare_domain"            = var.cloudflare_domain
    #   }
    # },
    # "atlantis" = {
    # name             = "atlantis"
    # repository       = "https://runatlantis.github.io/helm-charts"
    # chart            = "atlantis"
    # namespace        = "atlantis"
    # version          = "5.13.0"
    # create_namespace = true
    # values           = {
    # github_username = var.github_username
    # github_token    = var.github_token
    # github_secret   = var.github_secret
    # cloudflare_domain" = var.cloudflare_domai
    #   }
    # },
    "kube-prometheus-stack" = {
      name       = "kube-prometheus-stack"
      repository = "https://prometheus-community.github.io/helm-charts"
      chart      = "kube-prometheus-stack"
      namespace  = "monitoring"
      version    = "68.2.1"
      values     = {
        "hostname" = var.cloudflare_domain
      }
    },
    # "argo-workflow" = {
    # name       = "argo-workflow"
    # repository = "https://argoproj.github.io/argo-helm"
    # chart      = "kube-prometheus-stack"
    # namespace  = "monitoring"
    # version    = "68.2.1"
    # values     = {
        
    #   }
    # },
    # "k6" = {
    # name             = "k6"
    # repository       = "https://grafana.github.io/helm-charts"
    # chart            = "k6-operator"
    # namespace        = "monitoring"
    # version          = "3.10.1"
    # create_namespace = false
    # values           = {
        
    #   }
    # }
  }
}

resource "helm_release" "release" {
  for_each = local.list_of_releases

  name             = each.value.name
  repository       = each.value.repository
  chart            = each.value.chart
  version          = each.value.version
  namespace        = each.value.namespace
  create_namespace = lookup(each.value, "create_namespace", true)

  values = try(
    [templatefile("${path.module}/values/values-${each.value.name}.yaml", each.value.values)],
    []
  )
}