terraform {
    required_providers {
        cloudflare = {
            source = "cloudflare/cloudflare"
            version = "~> 2.0"
        }
    }
}

variable "CLOUDFLARE_EMAIL" {
    type = string
}
variable "CLOUDFLARE_API_KEY" {
    type = string
}

provider "cloudflare" { 
  email   = var.CLOUDFLARE_EMAIL
  api_key = var.CLOUDFLARE_API_KEY
}

resource "cloudflare_zone" "dogehouseonline" {
    zone = "dogehouse.online"
    plan = "free"
}

resource "cloudflare_record" "dogehouseonline" {
    zone_id = cloudflare_zone.dogehouseonline.id
    name    = "@"
    value   = "144.76.62.53"
    type    = "A"
    ttl     = 3600
}

resource "cloudflare_zone" "dogehousehost" {
    zone = "dogehouse.host"
    plan = "free"
}

resource "cloudflare_record" "dogehousehost" {
    zone_id = cloudflare_zone.dogehousehost.id
    name    = "@"
    value   = cloudflare_zone.dogehouseonline.zone
    type    = "CNAME"
    ttl     = 3600
}

resource "cloudflare_zone" "dogehousefun" {
    zone = "dogehouse.fun"
    plan = "free"
}

resource "cloudflare_record" "dogehousefun" {
    zone_id = cloudflare_zone.dogehousefun.id
    name    = "@"
    value   = cloudflare_zone.dogehouseonline.zone
    type    = "CNAME"
    ttl     = 3600
}

resource "cloudflare_zone" "dogehouseplus" {
    zone = "dogehouse.plus"
    plan = "free"
}

resource "cloudflare_record" "dogehouseplus" {
    zone_id = cloudflare_zone.dogehouseplus.id
    name    = "@"
    value   = cloudflare_zone.dogehouseonline.zone
    type    = "CNAME"
    ttl     = 3600
}