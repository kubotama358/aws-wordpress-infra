variable "common" {
  type = "map"
  default = {
    region = ""
    account_id = ""
  }
}

variable "wordpress_alb" {
  type    = "map"
  default = {
    name = ""
  }
}

variable "wordpress_alb_vpc_zone_identifier" {
  type    = "list"
  default = []
}

variable "wordpress_alb_target_group" {
  type = "map"
  default = {
    name = ""
    port = ""
    protocol = ""
    vpc_id = ""
  }
}

variable "wordpress_alb_target_group_attachment" {
  type = "map"
  default = {
    target_id = ""
    port = ""
  }
}

variable "wordpress_alb_listener" {
  type = "map"
  default = {
    port = ""
    protocol = ""
    ssl_policy = ""
    certificate_arn = ""
  }
}

variable "wordpress_alb_security_group" {
  type    = "map"
  default = {
    name = ""
    description = ""
    vpc_id      = ""
  }
}

variable "wordpress_alb_security_group_rule" {
  type    = "map"
  default = {
    description = []
    type        = []
    from_port   = []
    to_port     = []
    protocol    = []
    cidr_blocks = []
    self        = []
  }
}