terraform {
   required_providers {
     cloudflare = {
       source = "cloudflare/cloudflare"
       version = "~> 2.0"
   }
 }
}

provider "cloudflare" {

    email = "praveen.kumary@taylorandfrancis.com"
    api_key = "73105d638b947f77bf06d06cc790caf4cbb26"
}

variable "domain" {
  default = "taylorfrancis.net"
}
resource "cloudflare_zone" "taylorfrancis" {
    zone = "taylorfrancis.net"
    
}
resource "cloudflare_record" "foobar" {
  zone_id = "a604f63b60057eb635575bc179fc7d3c"
  name    = "terraform"
  value   = "213.212.74.246"
  type    = "A"
  ttl     = 1
  proxied = true
}

resource "cloudflare_page_rule" "foobar1" {
  priority = 1
  zone_id = "a604f63b60057eb635575bc179fc7d3c"
  target  = "*portal.taylorfrancis.net/*"
  status   = "active"

  actions {
   resolve_override = "taylorfrancis.net"
   name    = "terraform"
  value   = "213.212.74.246"
  type    = "A"
  ttl     = 1
  proxied = true
}

resource "cloudflare_page_rule" "foobar1" {
  priority = 1
  zone_id = "a604f63b60057eb635575bc179fc7d3c"
  target  = "*portal.taylorfrancis.net/*"
  status   = "active"

  actions {
   resolve_override = "taylorfrancis.net"
  }
}
}
