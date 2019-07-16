resource "aws_acm_certificate" "acm_certificate" {
  domain_name = "${var.acm_certificate["domain_name"]}"
  subject_alternative_names  = ["${var.acm_certificate["subject_alternative_names"]}"]
  validation_method = "${var.acm_certificate["validation_method"]}"
  tags = {
    Name = "${var.acm_certificate["tag_name"]}"
  }
}