resource "helm_release" "cloudflare-tunnel" {
    name             = "cloudflare-tunnel-ingress-controller"
    repository       = "https://helm.strrl.dev"
    chart            = "cloudflare-tunnel-ingress-controller"
    version          = "0.0.16"
    namespace        = "cloudflare-tunnel"
    create_namespace = true

    # values = [ 
        
    # ]

    set {
        name  = "cloudflare.apiToken"
        value = var.cloudflare_api_token
    }

    set {
        name  = "cloudflare.accountId"
        value = var.cloudflare_tunnel_account_id
    }
    set {
        name  = "cloudflare.tunnelName"
        value = var.cloudflare_tunnel_name
    }
}
