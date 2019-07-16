terraform {
  backend "s3" {
    key    = "wordpress/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "network" {
  backend = "s3"
  config {
    bucket = "aws-infra-tfstate"
    key    = "env:/${var.common["env"]}/network/terraform.tfstate"
    region = "ap-northeast-1"
    profile = "${var.common["env"]}"
  }
}