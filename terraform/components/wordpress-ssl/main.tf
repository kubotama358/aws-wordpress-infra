#####################################
# Application Road Barancer
#####################################
module "route53" {
  source = "../../modules/route53/hostzone"
  route53_zone = "${var.wordpress_server_route53_zone}"
}

module "acm" {
  source = "../../modules/acm"
  acm_certificate = "${var.wordpress_server_acm_certificate}"
}