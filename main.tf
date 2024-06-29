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

import {
  to = module.dns.cloudflare_record.base
  id = "02b627e256fd283baf39d8ca7d80e3a3/aac899d445b66a41a38ecd03946d5d89"
}
