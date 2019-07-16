common = {
  env = "my_dev"
  region = "ap-northeast-1"
}

wordpress_alb = {
  name = "wordpress-alb"
}

wordpress_alb_security_group = {
  name = "wordpress-alb"
  description = "wordpress-alb"
}

wordpress_alb_target_group = {
  name = "wordpress-alb-tg"
  port = "80"
  protocol = "HTTP"
}

wordpress_alb_target_group_attachment = {
  port = "80"
}

# ssl_policyはAWSで用意されているものを使用する。詳しくはググれ
wordpress_alb_listener = {
  port = "443"
  protocol = "HTTPS"
  ssl_policy = "ELBSecurityPolicy-2016-08"
}