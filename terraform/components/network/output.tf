# Output
output "vpc_id" {
  value = "${module.network.vpc_id}"
}

output "public_subnet_a" {
  value = "${module.network.public_subnet_a}"
}

output "public_subnet_c" {
  value = "${module.network.public_subnet_c}"
}