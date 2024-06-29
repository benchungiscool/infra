variable "cloudflare_zone" {}
variable "cloudflare_key" {}

data "local_file" "caddy" {
  filename = "Caddyfile"
}

module "dns" {
  source             = "./modules/dns"
  caddyfile_contents = data.local_file.caddy.content
  zone_id            = var.cloudflare_zone
  api_key            = var.cloudflare_key
}

