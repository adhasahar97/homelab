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