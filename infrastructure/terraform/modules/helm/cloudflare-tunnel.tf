resource "helm_release" "cloudflare-tunnel" {
    name             = "cloudflare-tunnel-ingress-controller"
    repository       = "https://helm.strrl.dev"
    chart            = "cloudflare-tunnel-ingress-controller"
    version          = "0.0.16"
    namespace        = "cloudflare-tunnel"
    create_namespace = true

    values = [templatefile("${path.module}/values/cloudflare-tunnel.yaml", {
      cloudflare_tunnel_token = var.cloudflare_tunnel_token
      cloudflare_tunnel_account_id   = var.cloudflare_tunnel_account_id
    })]
}
