common = {
  service_name = "mk-infra-v1"
  env = "my_dev"
  region = "ap-northeast-1"
}

wordpress_server_ec2 =  {
  ami = "ami-011ff0e4aae9334a1"
  instance_type = "t2.nano"
  iam_instance_profile = "stepserverRole"
  associate_public_ip_address = true
  monitoring = "yes"
}

wordpress_server_sg = {
}


wordpress_server_sg_rule = {
  description = ["in", "in", "in", "e"]
  type        = ["ingress", "ingress", "ingress", "egress"]
  from_port   = [80, 443, 22, 0]
  to_port     = [80, 443, 22, 0]
  protocol    = ["tcp", "tcp", "tcp", "-1"]
  cidr_blocks = [
    ["0.0.0.0/0"],
    ["0.0.0.0/0"],
    ["106.181.0.0/16"],
    ["0.0.0.0/0"]]
  self        = [false, false, false, false]
}
