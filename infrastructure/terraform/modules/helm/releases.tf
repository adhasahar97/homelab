locals {
  list_of_releases = {
    "argocd" = {
      name       = "argocd"
      repository = "https://argoproj.github.io/argo-helm"
      chart      = "argo-cd"
      namespace  = "argocd"
      version    = "7.7.15"
      values = templatefile("${path.module}/values/values-argocd.yaml", {

      })
    }
  }
}
