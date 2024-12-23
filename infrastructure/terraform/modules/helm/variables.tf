variable "cloudflare_tunnel_token" {
  description = "The token used to authenticate with Cloudflare's Zero Trust Tunneling service"
  type        = string
  sensitive = true
}
variable "cloudflare_tunnel_account_id" {
  description = "The account ID associated with the Cloudflare Zero Trust Tunneling service"
  type        = string
}