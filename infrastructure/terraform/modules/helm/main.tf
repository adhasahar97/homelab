provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

# resource "helm_release" "nginx" {
#     name       = "nginx"
#     repository = "https://kubernetes.github.io/ingress-nginx/"
#     chart      = "ingress-nginx"
#     version    = "4.11.3"
#     namespace  = "ingress"
#     create_namespace = true
# }

resource "helm_release" "cloudflare-tunnel" {
    name       = "cloudflare-tunnel-ingress-controller"
    repository = "https://helm.strrl.dev"
    chart      = "cloudflare-tunnel-ingress-controller"
    version    = "0.0.16"
    namespace  = "cloudflare-tunnel"
    create_namespace = true
}
