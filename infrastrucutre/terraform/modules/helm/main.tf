provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

# resource "helm_release" "nginx" {
#     name       = "nginx"
#     repository = "https://charts.bitnami.com/bitnami"
#     chart      = "nginx"
#     version    = "18.2.5"
#     namespace  = "ingress"
#     create_namespace = true
# }
