locals {
  base_name = "${var.common["service_name"]}-${var.common["env"]}"

  vpc_id = "${data.terraform_remote_state.network.vpc_id}"
  public_subnet = "${data.terraform_remote_state.network.public_subnet_a}"

  wordpress_server_ec2 = "${merge(
    var.wordpress_server_ec2,
    map("key_name", "${local.base_name}-wordpress-server"),
    map("subnet_id", "${local.public_subnet}"),
    map("tag_name", "${local.base_name}-wordpress-server")
  )}"

  wordpress_server_sg = "${merge(
     var.wordpress_server_sg,
     map("name", "${local.base_name}-wordpress-server"),
     map("description", "${local.base_name}-wordpress-server"),
     map("vpc_id", "${local.vpc_id}")
  )}"
}

module "wordpress_server" {
  source = "../../modules/ec2"
  ec2 = "${local.wordpress_server_ec2}"
  security_group = "${local.wordpress_server_sg}"
  security_group_rule = "${var.wordpress_server_sg_rule}"
}