provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "nginx" {
    name       = "nginx"
    repository = "https://kubernetes.github.io/ingress-nginx/"
    chart      = "nginx"
    version    = "4.12.0-beta.0"
    namespace  = "ingress"
    create_namespace = true
}
