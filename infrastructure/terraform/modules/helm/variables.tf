variable "cloudflare_api_token" {
    description = "The token used to authenticate with Cloudflare's Zero Trust Tunneling service"
    type        = string
  # sensitive   = true
}
variable "cloudflare_tunnel_account_id" {
  description = "The account ID associated with the Cloudflare Zero Trust Tunneling service"
  type        = string
}

variable "cloudflare_tunnel_name" {
  description = "Cloudflare tunnel name"
  type        = string
}

variable "cloudflare_domain" {
  description = "The hostname to be used with the Cloudflare tunnel"
  type        = string
}

# variable "github_token" {
#   description = "The token used to authenticate with GitHub's API"
#   type        = string
#   sensitive   = true
# }

# variable "github_username" {
#   description = "The username associated with your GitHub account"
#   type        = string
# }

# variable "github_secret" {
#   description = "The secret used to authenticate with GitHub's API"
#   type        = string
#   sensitive   = true
#   default     = ""
# }