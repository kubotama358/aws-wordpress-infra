common = {
  service_name = "mk-infra-v1"
  env = "my_dev"
  region = "ap-northeast-1"
}

vpc = {
  cidr_block = "10.30.0.0/16"
}

public_subnet_a = {
  cidr_block = "10.30.1.0/24"
  availability_zone = "a"
}

public_subnet_c = {
  cidr_block = "10.30.2.0/24"
  availability_zone = "c"
}