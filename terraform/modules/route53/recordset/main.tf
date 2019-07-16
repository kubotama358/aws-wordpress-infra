resource "aws_route53_record" "route53_record" {
  zone_id = "${var.route53_record["zone_id"]}"
  name    = "${var.route53_record["dns_name"]}"
  type    = "${var.route53_record["type"]}"

  alias {
    name                   = "${var.route53_record["alb_dns_name"]}"
    zone_id                = "${var.route53_record["alb_zone_id"]}"
    evaluate_target_health = false
  }
}