locals {
  common = {
    base_name = "${var.common["service_name"]}-${var.common["env"]}"
    region = "${var.common["region"]}"
  }
}

module "network" {
  source              = "../../modules/network"
  common              = "${local.common}"
  vpc                 = "${var.vpc}"
  public_subnet_a     = "${var.public_subnet_a}"
  public_subnet_c     = "${var.public_subnet_c}"
}