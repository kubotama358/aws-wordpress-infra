output "zone_id" {
  value = "${module.route53.zone_id}"
}

output "acm_certificate_arn" {
  value = "${module.acm.acm_certificate_arn}"
}