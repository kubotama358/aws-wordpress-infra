variable "ec2" {
  type = "map"
  default = {
    ami = ""
    instance_type = ""
    iam_instance_profile = ""
    key_name = ""
    associate_public_ip_address = ""
    subnet_id = ""
    tg_name = ""
    monitoring = "yes"
  }
}


variable "common" {
  type = "map"
  default = {
    service_name = ""
    env = ""
    region = ""
  }
}

variable "security_group" {
  type    = "map"
  default = {
    name        = ""
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
