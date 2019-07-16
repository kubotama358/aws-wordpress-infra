variable "common" {
  type = "map"
  default = {
    env = ""
    region = ""
  }
}

variable "wordpress_server_ec2" {
  type = "map"
  default = {
    ami = ""
    instance_type = ""
    iam_instance_profile = ""
    key_name = ""
    associate_public_ip_address = ""
    subnet_id = ""
    tag_name = ""
    monitoring = "yes"
  }
}

variable "wordpress_server_sg" {
  type    = "map"
  default = {
    name        = ""
    description = ""
    vpc_id      = ""
  }
}


variable "wordpress_server_sg_rule" {
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
