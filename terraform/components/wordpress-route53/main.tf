locals {
  zone_id = "${data.terraform_remote_state.wordpress-ssl.zone_id}"
  alb_dns_name = "${data.terraform_remote_state.wordpress-alb.dns_name}"
  alb_zone_id = "${data.terraform_remote_state.wordpress-alb.zone_id}"

  wordpress_route53_record = "${merge(
    var.wordpress_route53_record,
    map("zone_id", "${local.zone_id}"),
    map("alb_dns_name", "${local.alb_dns_name}"),
    map("alb_zone_id", "${local.alb_zone_id}")
  )}"
}

module "wordpress_server_route53_recordset" {
  source = "../../modules/route53/recordset"
  route53_record = "${local.wordpress_route53_record}"
}