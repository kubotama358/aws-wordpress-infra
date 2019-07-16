variable "common" {
  type = "map"
  default = {
    env = ""
    region = ""
  }
}

variable "wordpress_server_route53_zone" {
  type = "map"
  default = {
    name = ""
  }
}

variable "wordpress_server_acm_certificate" {
  type = "map"
  default = {
    domain_name = ""
    subject_alternative_names = ""
    validation_method = ""
    tag_name = ""
  }
}
