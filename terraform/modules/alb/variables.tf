variable "alb" {
  type    = "map"
  default = {
    name = ""
  }
}

variable "vpc_zone_identifier" {
  type    = "list"
  default = []
}

variable "target_group" {
  type = "map"
  default = {
    name = ""
    port = ""
    protocol = ""
    vpc_id = ""
  }
}

variable "target_group_attachment" {
  type = "map"
  default = {
    target_id = ""
    port = ""
  }
}

variable "listener" {
  type = "map"
  default = {
    port = ""
    protocol = ""
    ssl_policy = ""
    certificate_arn = ""
  }
}

variable "security_group" {
  type    = "map"
  default = {
    name = ""
    description = ""
    vpc_id      = ""
  }
}

variable "security_group_rule" {
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
