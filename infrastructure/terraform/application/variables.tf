variable "cloudflare_email" {
    description = "The email address associated with your Cloudflare account"
    type        = string
    default = ""
}

variable "cloudflare_tunnel_name" {
    description = "The name of the Cloudflare tunnel"
    type        = string
}

variable "cloudflare_api_token" {
    description = "The API token used to authenticate with Cloudflare's API"
    type        = string
    default = ""
}