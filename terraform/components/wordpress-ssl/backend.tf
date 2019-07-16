terraform {
  backend "s3" {
    key    = "wordpress-ssl/terraform.tfstate"
    region = "ap-northeast-1"
  }
}