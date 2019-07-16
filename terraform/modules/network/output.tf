output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "public_subnet_a" {
  value = "${aws_subnet.public_subnet_a.id}"
}

output "public_subnet_c" {
  value = "${aws_subnet.public_subnet_c.id}"
}