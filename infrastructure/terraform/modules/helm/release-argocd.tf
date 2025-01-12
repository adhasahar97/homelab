resource "helm_release" "argocd" {
    name             = "argocd"
    repository       = "https://argoproj.github.io/argo-helm"
    chart            = "argo-cd"
    version          = "7.7.15"
    namespace        = "argocd"
    create_namespace = true

    values = [templatefile("${path.module}/values-argocd.yaml", {
      
    })]
}
