variable "cloudflare_email" {
    description = "The email address associated with your Cloudflare account"
    type        = string
    default     = "excelmyrises123@gmail.com"
}

variable "cloudflare_tunnel_name" {
    description = "The name of the Cloudflare tunnel"
    type        = string
}

variable "cloudflare_api_token" {
    description = "The API token used to authenticate with Cloudflare's API"
    type        = string
    default     = ""
}

variable "cloudflare_account_id" {
    description = "The name of the Cloudflare tunnel"
    type        = string
    default     = "5b2f562a73bc2d4816ec68f4b653e38d"
}

variable "cloudflare_domain" {
    description = "The hostname to be used with the Cloudflare tunnel"
    type        = string
    default     = "adhshr.xyz"
}

variable "github_token" {
  description = "The token used to authenticate with GitHub's API"
  type        = string
  sensitive   = true
}

variable "github_username" {
  description = "The username associated with your GitHub account"
  type        = string
}

variable "github_secret" {
  description = "The secret used to authenticate with GitHub's API"
  type        = string
  sensitive   = true
  default     = ""
}