output "cloudflare_tunnel_token" {
  value = cloudflare_zero_trust_tunnel_cloudflared.k8s-tunnel.tunnel_token
}