variable "common" {
  type = "map"
  default = {
    env = ""
    region = ""
  }
}

variable "wordpress_route53_record" {
  type = "map"
  default = {
    zone_id = ""
    dns_name = ""
    type = ""
    alb_dns_name = ""
    alb_zone_id = ""
  }
}
