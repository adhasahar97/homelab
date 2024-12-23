provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "nginx" {
    name       = "nginx"
    repository = "https://kubernetes.github.io/ingress-nginx/"
    chart      = "ingress-nginx"
    version    = "4.11.3"
    namespace  = "ingress"
    create_namespace = true
}
