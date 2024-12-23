variable "cloudflare_tunnel_token" {
  description = "The token used to authenticate with Cloudflare's Zero Trust Tunneling service"
  type        = string
  sensitive = true
}