terraform {
  backend "s3" {
    key    = "network/terraform.tfstate"
    region = "ap-northeast-1"
  }
}