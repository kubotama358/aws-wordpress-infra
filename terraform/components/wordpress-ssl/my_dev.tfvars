common = {
  env = "my_dev"
  region = "ap-northeast-1"
}

wordpress_server_route53_zone = {
  name = "maze555.com"
}

wordpress_server_acm_certificate =  {
  domain_name = "maze555.com"
  subject_alternative_names = "*.maze555.com"
  validation_method = "DNS"
  tag_name = "maze555.com"
}
