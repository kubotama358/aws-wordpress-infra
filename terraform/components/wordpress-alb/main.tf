locals {
  vpc_zone_identifier = [
    "${data.terraform_remote_state.network.public_subnet_a}",
    "${data.terraform_remote_state.network.public_subnet_c}"
  ]

  security_group = "${merge(
    var.wordpress_alb_security_group,
    map("vpc_id", data.terraform_remote_state.network.vpc_id)
  )}"

  wordpress_alb_target_group = "${merge(
    var.wordpress_alb_target_group,
    map("vpc_id", data.terraform_remote_state.network.vpc_id)
  )}"

  wordpress_alb_target_group_attachment = "${merge(
    var.wordpress_alb_target_group_attachment,
    map("target_id", data.terraform_remote_state.wordpress.ec2_id)
  )}"

  wordpress_alb_listener = "${merge(
    var.wordpress_alb_listener,
    map("certificate_arn", data.terraform_remote_state.wordpress-ssl.acm_certificate_arn)
  )}"

  security_group_rule = {
    description = ["in", "e"]
    type = ["ingress", "egress"]
    from_port = [0, 0]
    to_port = [0, 0]
    protocol = ["-1", "-1"]
    cidr_blocks = [["0.0.0.0/0"], ["0.0.0.0/0"]]
    self = [false, false]
  }
}

#####################################
# Application Road Barancer
#####################################

// albの作成には2分〜3分程時間がかかる
module "alb" {
  source = "../../modules/alb"
  alb = "${var.wordpress_alb}"
  target_group = "${local.wordpress_alb_target_group}"
  target_group_attachment = "${local.wordpress_alb_target_group_attachment}"
  listener = "${local.wordpress_alb_listener}"
  http_listener = "${var.wordpress_alb_http_listener}"
  security_group = "${local.security_group}"
  security_group_rule = "${local.security_group_rule}"
  vpc_zone_identifier = "${local.vpc_zone_identifier}"
}