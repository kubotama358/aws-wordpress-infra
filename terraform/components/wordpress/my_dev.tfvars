common = {
  service_name = "mk-infra-v1"
  env = "my_dev"
  region = "ap-northeast-1"
}

wordpress_server_ec2 =  {
  ami = "ami-04484d512783d6a04"
  instance_type = "t2.nano"
  iam_instance_profile = "stepserverRole"
  associate_public_ip_address = true
  monitoring = "yes"
}

wordpress_server_sg = {
}


wordpress_server_sg_rule = {
  description = ["in", "e"]
  type        = ["ingress", "egress"]
  from_port   = [22, 0]
  to_port     = [22, 0]
  protocol    = ["tcp", "-1"]
  cidr_blocks = [
    ["106.181.0.0/16"],
    ["0.0.0.0/0"]]
  self        = [false, false]
}
