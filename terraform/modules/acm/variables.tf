variable "acm_certificate" {
  type = "map"
  default = {
    domain_name = ""
    subject_alternative_names = ""
    validation_method = ""
    tag_name = ""
  }
}