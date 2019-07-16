variable "common" {
  type = "map"
  default = {
    region = ""
  }
}
variable "vpc" {
  type = "map"
  default = {
    cidr_block = ""
  }
}

variable "public_subnet_a" {
  type = "map"
  default = {
    cidr_block = ""
    availability_zone = ""
  }
}

variable "public_subnet_c" {
  type = "map"
  default = {
    cidr_block = ""
    availability_zone = ""
  }
}